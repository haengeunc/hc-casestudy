# "thelook_bq" - connection using constant defined in manifest file
connection: "@{model_connection}"

include: "//bqo/*"

#test
 include: "/views/**/*.view" #best practice not to include all views - specify which one
include: "/explore/*.lkml"
include: "/explore/explore_order_items"
include: "/explore/explore_products"
include: "/explore/explore_users"
include: "/explore/order_items_extend.lkml"
include: "/dashboards/customer_behaviour.dashboard"
include: "/dashboards/summary.dashboard"
include: "/explore/explore_pii.lkml"


# include the refinements
include: "/refinements/**/*"

include: "/queries/queries_for_order_items.lkml" # includes all queries refinements

include: "/views/order_items_pagination.view.lkml"



datagroup: datagroup_daily_refresh {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  sql_trigger:  SELECT count(*) FROM order_items ;;
  description: "triggered when a new order items added to the order items table"
  max_cache_age: "24 hours" #Default value 1 hour cache - not needed as data only refreshes overnight
}


datagroup: daily_datagroup {
  sql_trigger: SELECT FORMAT_TIMESTAMP('%F', CURRENT_TIMESTAMP());;
  max_cache_age: "24 hours"
}

persist_with: datagroup_daily_refresh


#--control what views/fields become visible to users "column-level security"
access_grant: can_view_financial_data {
  user_attribute: department
  allowed_values: ["Finance"]
}

access_grant: level_access {
  user_attribute: level
  allowed_values: ["a"]
}

access_grant: is_pii_viewer {
  user_attribute: is_pii_viewer
  allowed_values: ["Yes"]   }




# refinement to extend the explore to give greater access

explore: +products {
  required_access_grants: [level_access]
  label: "products_level_a_access"
  join: inventory_items {
    sql_on:  ${products.id} = ${inventory_items.product_id}} ;;
    relationship: one_to_many
  }
}

map_layer: hc_map {
  file: "/maps/hc_map.json"
  format: topojson
  property_key: ""
}


#best practice not create all explores - be specific in what you are looking for

# #######################################################
# #------------------------------------------------------

# # explore: inventory_items {
# #   join: products {
# #     type: left_outer
# #     sql_on: ${inventory_items.product_id} = ${products.id} ;;
# #     relationship: many_to_one
#   }

#   join: distribution_centers {
#     type: left_outer
#     sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#     relationship: many_to_one
#   }
# }

#######################################################
#------------------------------------------------------

# explore: orders {
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }

#######################################################
# #------------------------------------------------------
# explore: events {
#   join: users {
#     type: left_outer
#     sql_on: ${events.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }
