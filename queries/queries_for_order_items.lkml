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