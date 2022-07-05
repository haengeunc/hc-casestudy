include: "/views/order_items.view"
include: "/views/users.view"
include: "/views/order_items_derived.view"
include: "/views/inventory_items.view"
include: "/views/orders.view"
include: "/views/products.view"
include: "/views/distribution_centers.view"
# include: "/views/events.view"
include: "/views/sequence_derived.view"




#######################################################
#------------------------------------------------------
explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: order_items_derived {
    type: left_outer
    sql_on: ${users.id} = ${order_items_derived.user_id} ;;
    relationship: one_to_one
  }

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
