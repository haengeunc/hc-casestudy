# If necessary, uncomment the line below to include explore_source.
# include: "explore_order_items.lkml"

view: order_items_ndt {
  derived_table: {
    explore_source: order_items {
      bind_all_filters: no
        column: user_id {}
        column: total_revenue {}
        column: count {}
        column: first_order {}
        column: latest_order {}
    }

    datagroup_trigger: datagroup_daily_refresh

  }

  dimension: user_id {
    description: ""
    primary_key: yes
    type: number
  }
  dimension: total_revenue {
    description: "Total revenue from all items, including returned"
    value_format_name: gbp_0
    type: number
  }
  dimension: count {
    label: "Order Items Count of Order Items"
    description: ""
    type: number
  }
  dimension: first_order {
    description: ""
    type: number
  }
  dimension: latest_order {
    description: ""
    type: number
  }

  measure: lifetime_total_revenue {
    type: sum
    sql: ${total_revenue} ;;
  }


}