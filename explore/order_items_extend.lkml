include: "/explore/explore_order_items.lkml"

explore: order_items_extended {
  extends: [order_items]
  sql_always_where: ${order_items.created_date} = "30 days" ;;

}
