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
  view_name: order_items

  #demo/testing how to use sql_always_where - user cannot change - fixed value
  #sql_always_where: ${orders.status} = 'Complete' ;;

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

  join: order_items_ndt {
    type: left_outer
    sql_on: ${order_items.id} = ${order_items_ndt.user_id} ;;
    relationship: many_to_one

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
