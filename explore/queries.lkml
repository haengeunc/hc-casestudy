#this is an example of refinements where pre-defined query is created
#for users to click on with fields selected (via Explore)

include: "/explore/explore_order_items.lkml"

explore: +order_items {
  query: Order_overview {
    label: "Order Items Overview"
    description: "Use for pre-defined query to see orders overview"
    dimensions: [order_id]
    measures: [total_sale_price]
  }
}
