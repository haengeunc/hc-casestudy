connection: "thelook_bq"

# include all the views
include: "/views/**/*.view"

datagroup: haengeun_case_study_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  sql_trigger:  SELECT count(*) FROM order_items ;;
  max_cache_age: "24 hours" #Default value 1 hour cache - not needed as data only refreshes overnight
}

persist_with: haengeun_case_study_default_datagroup
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
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}


#######################################################
#------------------------------------------------------


explore: fact_table {}
