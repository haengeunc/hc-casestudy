include: "/explore/explore_order_items.lkml"

explore: order_items_extended {
  extends: [order_items]
  sql_always_where: ${order_items.created_date} = "30 days" ;;

}


#refinement example
# explore: +order_items {

#   label: "Demo refinement - order items"

#   fields: [ALL_FIELDS*, -order_items.inventory_item_id]

#   required_access_grants: [is_pii_viewer]

#   sql_always_where: ${users.country} = 'United Kingdom';;

#   always_filter:{
#     filters: [users.country: "United Kingdom"]
#   }

# }
