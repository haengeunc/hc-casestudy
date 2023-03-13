explore:incremental_pdt_ndt {}

view: incremental_pdt_ndt {
  derived_table: {
    datagroup_trigger: daily_datagroup
    increment_key: "created_date"
    increment_offset: 3
    explore_source: order_items {
      column: order_id {}
      column: sale_price {}
      column: created_date {}
      column: created_week {}
      column: created_month {}
      column: state { field: users.state }
    }
  }
  dimension: order_id {
    primary_key:  yes
    type: number
  }
  dimension: sale_price {
    description: ""
    type: number
  }
  dimension: created_date {
    description: ""
    type: date
  }
  dimension: created_week {
    description: ""
    type: date_week
  }
  dimension: created_month {
    description: ""
    type: date_month
  }
  dimension: state {
    description: ""
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd_0
  }
  measure: total_revenue {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }
}
