include: "/views/orders/order_items.view"

explore: order_items_pagination {}

view: order_items_pagination {

  derived_table: {
    sql: select *
           from looker-private-demo.thelook.order_items
          limit {% parameter rows_per_page %}
         offset {{ rows_per_page._parameter_value | times: page_number._parameter_value | minus: rows_per_page._parameter_value }}
    ;;
  }

  parameter: rows_per_page {
    type: number
  }

  parameter: page_number {
    type: number
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: returned_at {
    type: time
    sql: ${TABLE}.returned_at ;;
  }

  dimension: shipped_at {
    type: date
    datatype: date
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: delivered_at {
    type: date
    datatype: date
    sql: ${TABLE}.delivered_at ;;
  }

  set: detail {
    fields: [
      id,
      order_id,
      user_id,
      inventory_item_id,
      sale_price,
      status,
      created_at_time,
      returned_at_time,
      shipped_at,
      delivered_at
    ]
  }

}
