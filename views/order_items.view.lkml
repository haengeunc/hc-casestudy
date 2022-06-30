view: order_items {
  sql_table_name: `thelook.order_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
    filters: [status: "Returned"]
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

    #Link to dashboard customer behaviour, with selected filter applied
    link: {
      label: "Customer Info"
      url: "/dashboards/1?Category={{_filters['products.category'] | url_encode }}&Status={{ value | url_encode }}"
      }

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
      url: "{{link}}&f[order_items.total_profit]=>=500"
      }
  }

  measure: count_order {
    type: count_distinct
    label: "Count of Orders"
    sql:  ${order_id} ;;
    drill_fields: [detail*]
    html: <p style="font-size: 15px">{{linked_value}}</p> ;;
  }

  measure: total_sale_price {
    type: sum
    value_format_name: gbp
    sql: ${sale_price} ;;
    html: <font color="blue">{{rendered_value}}</font> ;;
  }

  measure: average_sale_price {
    type: average
    value_format_name: gbp
    sql: ${sale_price} ;;

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



#Gross Margin
  measure: profit {
    type: number
    value_format_name: gbp
    sql: ${sale_price} - ${products.cost} ;;
  }




#Total Gross Margin
  measure: total_profit {
    type: sum
    value_format_name: gbp
    sql: ${sale_price} - ${products.cost}  ;;
  }
  # question - cannot refer to ${profit}... not aggregate of an aggregate? What's wrong with it?
  #could also do total price - total cost as type number?


  measure: gross_margin_percent{
    label: "Gross Margin %"
    type: number
    value_format_name:percent_1
    sql: ${total_profit}/${total_sale_price} ;;
  }


  parameter: category {
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



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.full_name,
      inventory_items.product_name,
      orders.order_id
    ]
  }
}
