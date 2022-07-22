view: order_items {
  sql_table_name: `@{environment}.order_items` ;;
  #using constant variable defined in manifest file to refer to scheme - "thelook"
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    label: "Order Items ID"
    link: {
      label: "Contact support"
      url: "mailto:haengeun@looker.com"
    }
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;

  }

  dimension: Current_Date{
    type: date
    sql: (CURRENT_TIMESTAMP()) ;;
    html: {{ rendered_value | date: "%d-%m-%Y" }} ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_at ;;
  }

  dimension_group: duration_item_received_since_order{
    type:  duration
    intervals: [
      day,
      week,
      month,
      year
    ]
    sql_start: ${created_date} ;;
    sql_end: ${delivered_date}  ;;
  }

  measure: average_days_item_received_since_order{
    type: average
    sql: ${days_duration_item_received_since_order} ;;
    value_format: "#.##"
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }


  dimension: order_id {
    label: "Order ID"
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    description: "When order item was returned"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }
  #date can be formatted using html: {{ rendered_value | date: "%B %e, %Y" }} ;;

  measure: count_returned_items {
    type: count
    filters: [order_items.status: "Returned"]
  }

  measure: count_customer_with_returned_items {
    type: count_distinct
    sql: ${user_id} ;;
    description: "Number of users who have returned an item at some point"
    filters: [order_items.status: "Returned"]
  }

  measure: percent_item_returned {
    description: "Number of Items Returned / total number of items sold"
    label: "Item returned %"
    type: number
    value_format_name: percent_1
    sql: ${count_returned_items} /  NULLIF( ${count_item_sold},0) ;;
  }

  measure: percent_customer_with_returns  {
    description: "Number of customer returning items / total number of customers"
    label: "Customer with returns %"
    type: number
    value_format_name: percent_1
    sql: SAFE_DIVIDE(${count_customer_with_returned_items}, ${count_customers}) ;; #BigQuery function to divide whilst handling 0 division situation
  }

  measure: count_customers {
    type: count_distinct
    sql: ${user_id} ;;
  }


  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }


  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;

   # Link to dashboard customer behaviour, with selected filter applied ---try both in html + link
    # link: {
    #   label: "Customer Info"
    #   url: "/dashboards/1?Category={{_filters['products.category'] | url_encode }}&Status={{ value | url_encode }}"
    #   }


    # link: {
    #   label: "Customer Info"
    #   url: "/dashboards/1?Category={{_filters['products.category']| url_encode }}&Status={{ value | url_encode }}"
    # }

  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }



  measure: count {
    type: count
    label: "Count of Order Items"
    drill_fields: [detail*]
    link:{
      label: "Filtered Drill Modal (Total Profit over £500)"
      url: "{{link}}&f[order_items.total_gross_margin]=>=500"
      }
  }

  measure: count_order {
    type: count_distinct
    label: "Count of Orders"
    sql:  ${order_id} ;;
    drill_fields: [detail*]
    html: <p style="font-size: 15px">{{linked_value}}</p> ;;
  }

  measure: count_item_sold{
    label: "Count of Items Sold"
    description: "When an order is placed, the item ordered is immediately marked as sold within the warehouse"
    type: count
    filters: [order_items.status: "Complete, Processing, Shipped"]
  }



  measure: total_sale_price {
    type: sum
    value_format_name: gbp
    sql: ${sale_price} ;;
    description: "Total revenue from all items, including returned"
    drill_fields: [detail*]

    #html: <font color="blue">{{rendered_value}}</font> ;;
  }

  measure: total_revenue_complete {
    type: sum
    value_format_name: gbp
    sql: ${sale_price} ;;
    filters: [order_items.status: "Complete, Processing, Shipped"]

    description: "Total revenue from items sold"
    html: <font color="blue">{{rendered_value}}</font> ;;
  }

  measure: average_sale_price {
    type: average
    value_format_name: gbp
    sql: ${sale_price} ;;
    filters: [order_items.status: "Complete, Processing, Shipped"]
    description: "Average sales from items sold"

    #Format based on the conditions logic
    html: {% if value >= 600 %}
          <font color="green">{{rendered_value}}</font>
          {% elsif value >= 400 and value < 600 %}
          <font color="goldenrod">{{rendered_value}}</font>
          {% else %}
          <font color="red">{{rendered_value}}</font>
          {% endif %} ;;
  }

  measure: cumulative_total_sales  {
    type:  running_total
    sql:  ${total_sale_price} ;;
    value_format_name: gbp
    drill_fields: [detail*]
  }

  measure: average_spend_per_customer {
    type: number
    description: "Total sale price / total number of customers"
    sql: ${total_sale_price} / NULLIF( ${count_customers},0)  ;;
    value_format_name: gbp
  }

#Gross Margin
  dimension: gross_margin {
    type: number
    value_format_name: gbp
    sql: ${sale_price} - ${products.cost} ;;

  }




#Total Gross Margin
  measure: total_gross_margin {
    type: sum
    value_format_name: gbp
    sql: ${gross_margin}  ;;
    filters: [order_items.status: "Complete, Processing, Shipped"]
    drill_fields: [product_detail*]
    description: "Total gross margin from items sold"
  }

#Average Gross Margin
  measure: average_gross_margin {
    type: average
    value_format_name: gbp
    sql: ${gross_margin}  ;;
    filters: [order_items.status: "Complete, Processing, Shipped"]
    drill_fields: [detail*]
    description: "Average gross margin from items sold"

  }



  measure: gross_margin_percent{
    label: "Gross Margin %"
    type: number
    value_format_name:percent_1
    sql: ${total_gross_margin}/NULLIF( ${total_sale_price} ,0) ;;
    description: "Gross margin percentage from items sold"
    required_access_grants: [can_view_financial_data]
  }



measure: first_order {
  type: date
  sql: MIN(${created_date}) ;;

}

  measure: latest_order {
    type: date
    sql: MAX(${created_date}) ;;

  }

  parameter: category_filter {
      type: string
      allowed_value: {
        label: "Choose"
        value: "Jeans"
      }
        allowed_value: {
          label: "Choose 2"
          value: "Pants"
      }
    }

## -------- Using parameter to create dynamic fields

 measure: dynamic_sum {
    type: sum
    sql: ${TABLE}.{% parameter item_to_add_up %} ;;
    value_format_name: "gbp"
  }

  parameter: item_to_add_up {
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "sale_price"
    }
    allowed_value: {
      label: "Total Cost"
      value: "products.cost"  #cost not an option?
    }
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.full_name,
      inventory_items.product_name,
      order_items.order_id
    ]
  }

  #Drill into specific product categories and brands
  set: product_detail {
    fields: [
      users.country,
      users.state,
      total_gross_margin,
      products.category,
      products.brand
    ]
  }




}
