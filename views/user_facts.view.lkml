view: fact_table {
  derived_table: {
    sql: SELECT
        order_items.user_id as user_id,

        COUNT(DISTINCT order_items.order_id) as lifetime_order_count,
        SUM(sale_price) as lifetime_revenue,
        rank() over (partition by user_id order by created_at asc) as order_sequence_number


      FROM order_items
      LEFT JOIN products on products.id = order_items.product_id
      GROUP BY user_id
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

  set: detail {
    fields: [user_id, lifetime_order_count, lifetime_revenue]
  }
}
