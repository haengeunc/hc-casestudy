view: order_items_derived {

  derived_table: {

    sql: SELECT
        order_items.user_id as user_id,
        MIN(created_at) as first_order,
        MAX(created_at) as latest_order,
        COUNT(DISTINCT order_items.order_id) as count_lifetime_order,
        SUM(sale_price) as lifetime_revenue,

      FROM order_items
      --build dynamic filter to create the derived table
      WHERE {% condition order_status_filter %} order_items.status {% endcondition %}

      GROUP BY user_id ;;

  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }


## -------- Using parameter to create dynamic derived table
  filter: order_status_filter {
    type: string
    suggest_explore: order_items
    suggest_dimension: orders.status
    }



# -----------------------------------------------------------

  measure: count {
    type: count
    label: "Count Users"
    drill_fields: [detail*]
  }

  measure: average_count {
    label: "Average Lifetime Orders"
    description: "Average number of orders placed by a customer over the course of their lifetime"
    type: average
    sql: ${count_lifetime_order} ;;
  }




  dimension: count_lifetime_order {
    description: "Total number of orders placed over the course of customers' lifetimes"
    type: number
    sql: ${TABLE}.count_lifetime_order ;;
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
  }

  measure: lifetime_average_revenue {
    label: "Average lifetime revenue"
    type: average
    sql: ${lifetime_revenue} ;;
  }

  measure: lifetime_total_sale_price {
    label: "Total lifetime revenue"
    type: sum
    value_format_name: gbp_0
    sql: ${lifetime_revenue} ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_lifetime_orders_group {
    description: "Total number of orders that a customer has placed since first using the website"
    type: tier
    tiers: [2, 3, 6, 10]
    sql: ${count_lifetime_order} ;;
    style:  integer
  }

  dimension: customer_lifetime_revenue_group {
    type: tier
    tiers: [5, 20, 50, 100, 500, 1000]
    value_format: "$#.00"
   style: integer
  # tiers: [4.99,19.99,49.99,99.99,499.99,999.99]
  # style: relational
    sql: ${lifetime_revenue} ;;
  }


  dimension: first_order {
    label: "First Order Date"
    type: date
    sql: ${TABLE}.first_order;;
  }

  dimension: latest_order {
    label: "Latest Order Date"
    type: date
    sql: ${TABLE}.latest_order;;
  }

  dimension: is_active_customer{
    description: "Yes if customer purchased from the website within the last 90 days"
    type: yesno
    sql: ${days_since_latest_order} <= 90 ;;
  }

  dimension: days_since_latest_order {
    type: number
    sql: date_diff(current_date, ${latest_order}, day) ;;
  }




  # dimension: business_days_since_lastest_order {

  #   type: number
  #   sql: DATE_DIFF(current_date,${latest_order}, day) -

  #   ((FLOOR(DATE_DIFF(current_date,${latest_order}, day)/7)*2)
  #     +
  #       CASE WHEN
  #         EXTRACT(DAYOFWEEK FROM DATE ${latest_order}) -
  #         EXTRACT(DAYOFWEEK FROM DATE ${latest_order})  IN (1,2,3,4,5) AND EXTRACT(DAYOFWEEK FROM DATE ${latest_order}) !=0
  #       THEN 1 ELSE 0 END
  #     +
  #       CASE WHEN
  #       EXTRACT(DAYOFWEEK FROM DATE ${latest_order}) != 0 AND EXTRACT(DAYOFWEEK FROM DATE ${latest_order}) = 0
  #       THEN 1 ELSE 0 END
  #     +
  #       CASE WHEN EXTRACT(DAYOFWEEK FROM DATE ${latest_order}) = 0 AND EXTRACT(DAYOFWEEK FROM DATE ${latest_order}) != 0
  #       THEN 2 ELSE 0 END
  #     );;

  # }



  measure: average_days_since_latest_order {
    type: average
    sql: ${days_since_latest_order} ;;
  }

  dimension: is_repeat_customer{
    type: yesno
    sql: ${count_lifetime_order} > 1 ;;
  }

  dimension: is_first_purchase {
    type: yesno
    description: "yes if first oder date and latest order same"
    sql: ${first_order} = ${latest_order} ;;

    html:{% if value == "Yes" %}

      <p style="color: green">{{ rendered_value }}</p>

    {% elsif value == 'No' %}
    <p style="color: red">{{ rendered_value }}</p>
    {% endif %};;

  }

  measure: count_recurring_customer {
    type: count_distinct
    sql: ${user_id};;
    filters: [is_repeat_customer: "yes"]
  }




  set: detail {
    fields: [user_id, count_lifetime_order, lifetime_revenue]
  }
}
