# include: "/views/z_misc/parameters.view.lkml"
# include: "/views/orders/order_items_rank_ndt.view.lkml"
# include: "/views/orders/order_items.view.lkml"
# include: "/views/products/products.view.lkml"

# explore: explore_order_items_top_rank {
#   from: order_items
#   view_label: "Order Items Rank"

#   join: parameters {}

#   join: products {
#     type: left_outer
#     sql_on: ${order_items_rank_ndt.product_attribute} = ${products.brand} ;;
#     relationship: many_to_one
#   }

#   join: order_items_rank_ndt {
#     type: inner
#     relationship: many_to_one
#     sql_on: ${order_items_rank_ndt.product_attribute}=${products.brand}
#     ;;


#     view_label: "Top N"
#   }
#   }


# # {% if order_items_rank_ndt.dimension_criteria._parameter_value == "'Brand'" %}
# #             ${order_items_rank_ndt.product_attribute}=${orders_product_data.order_product_brand}
# #             {% elsif order_items_rank_ndt.dimension_criteria._parameter_value == "'Category'" %}
# #             order_product_category=${orders_product_data.order_product_category}
# #             {% elsif order_items_rank_ndt.dimension_criteria._parameter_value == "'Product Name'" %}
# #             order_product_name=${orders_product_data.order_product_name}
# #             {% endif %}
# #             ;;
