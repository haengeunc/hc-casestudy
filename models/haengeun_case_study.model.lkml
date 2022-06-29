connection: "thelook_bq"

# include all the views
include: "/views/**/*.view"

datagroup: datagroup_daily_refresh {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  sql_trigger:  SELECT count(*) FROM order_items ;;
  max_cache_age: "24 hours" #Default value 1 hour cache - not needed as data only refreshes overnight
}

persist_with: datagroup_daily_refresh
#testing gitHub branch


#######################################################
#------------------------------------------------------


explore: distribution_centers {}


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
}

#######################################################
#------------------------------------------------------

explore: inventory_items {
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
}

#######################################################
#------------------------------------------------------

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

#######################################################
#------------------------------------------------------
explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}


#######################################################
#------------------------------------------------------

explore: users {
  conditionally_filter: {
    filters: [users.created_date: "90 days"]
    unless: [users.id, users.city]
    }
}


#######################################################
#------------------------------------------------------


explore: products {
  label: "Explore products"
  description: "To analyse data related to products and distribution centers"
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}


#######################################################
#------------------------------------------------------


#######################################################
#------------------------------------------------------

#--control what views/fields become visible to users
access_grant: can_view_financial_data {
  user_attribute: department
  allowed_values: ["finance"]
}
