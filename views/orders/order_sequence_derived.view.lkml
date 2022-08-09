view: sequence_derived {
    derived_table: {
      datagroup_trigger: datagroup_daily_refresh


      sql: SELECT
        order_items.user_id as user_id,
        rank() over (partition by user_id order by created_at asc) as order_sequence_number,
        rank() over (partition by user_id order by sale_price asc) as order_rank_by_sale_price

        FROM order_items ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: user_id {
      primary_key: yes
      type: number
      sql: ${TABLE}.user_id ;;

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
      fields: [order_sequence_number, order_rank_by_sale_price]
    }
  }
