include: "/models/haengeun_case_study.model.lkml"

explore: +order_items {
  aggregate_table: rollup__created_date {
    query: {
      dimensions: [created_date]
      measures: [count, count_order, total_sale_price]
    }

    materialization: {
      datagroup_trigger: daily_datagroup
    }
  }
}
