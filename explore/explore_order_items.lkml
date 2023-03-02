include: "/views/orders/order_items.view"
include: "/views/orders/orders.view"
include: "/views/orders/order_items_ndt.view"
include: "/views/orders/order_items_derived.view"
include: "/views/orders/order_sequence_derived.view"


include: "/views/products/products.view"
include: "/views/products/inventory_items.view"
include: "/views/products/distribution_centers.view"


include: "/views/users/users.view"


#######################################################
#------------------------------------------------------
explore: order_items {

  #how to pair with mapping table with Looker user attributes to manage row level security
  # sql_always_where: ${products.brand} IN (SELECT brand from ${user_brand_access.SQL_TABLE_NAME}
  #                   WHERE user_id = '{{_user_attributes['email']}}');;

  symmetric_aggregates: yes
  view_name: order_items
   persist_with: datagroup_daily_refresh
  # sql_always_where: ${order_items.created_date} >= "2019-01-01" ;;

  # sql_always_having: ${count_order} > 10 ;;

  # always_filter: {
  #   filters: [order_items.status: "Complete", users.country: "USA"]
  # }

  # conditionally_filter: {
  #   filters: [order_items.created_date: "1 month"]
  #   unless: [users.id, users.state]
  # }

  #demo/testing how to use sql_always_where - user cannot change - fixed value
  #sql_always_where: ${orders.status} = 'Complete' ;;

  # always_filter: {
  #   filters: [order_items.created_date: "30 days"]
  # }

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one

  }

  join: order_items_derived {
    type: left_outer
    sql_on: ${order_items.user_id} = ${order_items_derived.user_id} ;;
    relationship: many_to_one

  }

  # join: order_items_ndt {
  #   type: left_outer
  #   sql_on: ${order_items.id} = ${order_items_ndt.user_id} ;;
  #   relationship: many_to_one

  # }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  #consider if joining order items and events makes sense.... though dashboard can have cross filtering only if from the same explore

  # join: events {
  #   type: left_outer
  #   sql_on: ${events.user_id} = ${order_items.user_id} ;;
  #   relationship: many_to_many
  # }

  join: sequence_derived {
    type: left_outer
    sql_on: ${order_items.user_id} = ${sequence_derived.user_id} ;;
    relationship: many_to_one
  }



}
