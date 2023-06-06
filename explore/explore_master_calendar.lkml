include: "/views/orders/order_items.view"


include: "/views/users/users.view"
include: "/views/products/products.view"
include: "/views/z_misc/master_date_field.view"

#######################################################
#------------------------------------------------------
explore: master_date_field {

  join: order_items {
    type: left_outer
    sql_on: ${order_items.created_date} = ${master_date_field.calendar_date} ;;
    relationship: one_to_one
  }

      join: users {
        type: left_outer
        sql_on: ${order_items.user_id} = ${users.id} ;;
        relationship: many_to_one
      }

  fields: [ALL_FIELDS*,
    -order_items.count_returned_items,
    -order_items.masked_sale_price,
    -order_items.average_gross_margin,
    -order_items.gross_margin,
    -order_items.average_sale_price,
    -order_items.count_item_with_status,
    -order_items.count_item_sold,
    -order_items.count_customer_with_returned_items,
    -order_items.count_returned_items,
    -order_items.total_sale_price_complete,
    -order_items.percent_customer_with_returns,
    -order_items.percent_item_returned,
    -order_items.gross_margin_percent,
    -order_items.total_gross_margin]


}
