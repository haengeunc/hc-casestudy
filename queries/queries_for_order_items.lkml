include: "/explore/explore_order_items.lkml" # include all the views

explore: +order_items {
  query: inventory_aging {
    description: "Volume of inventory by age of stock item"
    dimensions: [inventory_items.days_in_inventory_tier]
    measures: [inventory_items.count]
    #filters: [distribution_centers.name: "Chicago IL"]
  }

  query: Order_overview {
    label: "Order Items Overview"
    description: "Use for pre-defined query to see orders overview"
    dimensions: [order_id]
    measures: [total_revenue]
  }

}

explore: +order_items {
  query: order_count_by_month_in_2021 {
    description: "Number of orders placed by month in 2021"
    dimensions: [order_items.created_month]
    measures: [order_items.count]
    filters: [order_items.created_date: "2021"]
  }
}


explore: +order_items {

  query: user_count_by_month_in_2021 {
    description: "No. of orders by month by department (men/women) in 2021"
    dimensions: [order_items.created_month]
    measures: [order_items.count_customers]
    filters: [order_items.created_date: "2021"]
  }
}


explore: +order_items {

  query: revenue_order_status_by_date{
    description: "Total revenue by order status by date in the last 30 days"
    dimensions: [order_items.created_date]
    measures: [order_items.total_revenue]
    pivots: [order_items.status]
    filters: [order_items.created_date: "last 30 days"]
  }
}
