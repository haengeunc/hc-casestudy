
include: "/views/users/users.view"
include: "/views/users/events.view"
include: "/views/orders/order_items.view"



####################################################### this exlore is for users related analysis
#------------------------------------------------------

explore: users {

  #products is not accessible via users explore - needs to remove gross margin calculation since it's using products table
  fields: [ALL_FIELDS*,

          -order_items.gross_margin,
          -order_items.total_gross_margin,
          -order_items.average_gross_margin,
          - order_items.gross_margin_percent,
          - order_items.masked_sale_price]

  # conditionally_filter: {
  #   filters: [users.created_date: "90 days"]
  #   unless: [users.id, users.city]
  # }

  join: events {
    type: left_outer
    sql_on: ${users.id} = ${events.user_id} ;;
    relationship: one_to_many
  }

  join: order_items {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: one_to_many
  }

}


#Not best practice from performance perspective to have one-to-many relationship? Use many-to-one where possible?
