view: MoM_order_items{
  derived_table: {
    sql: WITH monthly_metrics AS (
       SELECT
         (EXTRACT(YEAR FROM order_items.created_at )) AS year,
         (EXTRACT(MONTH FROM order_items.created_at )) AS month,
         COALESCE(SUM(order_items.sale_price ), 0) AS revenue
       FROM `thelook.order_items`  AS order_items
       GROUP BY 1, 2
      )
      SELECT
        year, month, revenue,
        LAG(revenue) OVER (ORDER BY year, month) as Revenue_previous_month,
        revenue - LAG(revenue) OVER (ORDER BY year, month) as Month_to_month_difference

      FROM monthly_metrics
      ORDER BY 1,2
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: revenue_previous_month {
    type: number
    sql: ${TABLE}.Revenue_previous_month ;;
  }

  dimension: month_to_month_difference {
    type: number
    sql: ${TABLE}.Month_to_month_difference ;;
  }

  set: detail {
    fields: [year, month, revenue, revenue_previous_month, month_to_month_difference]
  }
}
