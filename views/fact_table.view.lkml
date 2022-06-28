view: fact_table {
  derived_table: {
    sql: SELECT
        order_items.user_id as user_id,

      COUNT(DISTINCT order_items.order_id) as lifetime_order_count,
      SUM(sale_price) as lifetime_revenue,
      created_at,
      rank() over (partition by user_id order by created_at asc) as order_sequence_number,
      rank() over (partition by user_id order by sale_price asc) as order_rank_by_sale_price,


      FROM order_items
      GROUP BY user_id, created_at, sale_price
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: lifetime_order_count {
    type: number
    sql: ${TABLE}.lifetime_order_count ;;
  }

  dimension: lifetime_revenue {
    type: number
    sql: ${TABLE}.lifetime_revenue ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: order_sequence_number {
    type: number
    sql: ${TABLE}.order_sequence_number ;;
  }

  dimension: order_rank_by_sale_price {
    type: number
    sql: ${TABLE}.order_rank_by_sale_price ;;
  }


  set: detail {
    fields: [user_id, lifetime_order_count, lifetime_revenue, created_at_time, order_sequence_number]
  }
}
