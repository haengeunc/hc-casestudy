# explore: incremental_pdt_sql {}

# #https://cloud.google.com/looker/docs/reference/param-view-increment-key#creating_an_incremental_sql-based_pdt

# view: incremental_pdt_sql {
#     derived_table: {
#       # datagroup_trigger: daily_datagroup
#       sql_trigger_value: SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP())  ;;
#       increment_key: "created_date"
#       increment_offset: 3

#       sql: SELECT
#           order_items.order_id  AS order_id,
#           order_items.sale_price  AS sale_price,
#               (DATE(order_items.created_at )) AS created_date,
#               (FORMAT_TIMESTAMP('%Y-%m', order_items.created_at )) AS created_month,
#               (FORMAT_TIMESTAMP('%F', TIMESTAMP_TRUNC(order_items.created_at , WEEK(MONDAY)))) AS created_week
#       FROM `cloud-training-demos.looker_ecomm.order_items`
#       AS order_items
#       WHERE {% incrementcondition %} DATE(order_items.created_at ) {%  endincrementcondition %}
#       ;;
#     }

#     measure: count {
#       type: count
#       drill_fields: [detail*]
#     }

#     dimension: order_id {
#       type: number
#       sql: ${TABLE}.order_id ;;
#     }

#     dimension: sale_price {
#       type: number
#       sql: ${TABLE}.sale_price ;;
#     }

#     dimension: created_date {
#       type: date
#       datatype: date
#       sql: ${TABLE}.created_date ;;
#     }

#     dimension: created_month {
#       type: string
#       sql: ${TABLE}.created_month ;;
#     }

#     dimension: created_week {
#       type: string
#       sql: ${TABLE}.created_week ;;
#     }

#   measure: average_sale_price {
#     type: average
#     sql: ${sale_price} ;;
#     value_format_name: usd_0
#   }
#   measure: total_revenue {
#     type: sum
#     sql: ${sale_price} ;;
#     value_format_name: usd
#   }

#     set: detail {
#       fields: [order_id, sale_price, created_date, created_month, created_week]
#     }
#   }
