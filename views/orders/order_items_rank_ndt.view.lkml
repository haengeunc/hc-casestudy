# ###https://www.googlecloudcommunity.com/gc/Modeling/Analytic-Block-Pivot-by-Top-X-Introducing-bind-all-filters-yes/td-p/578230?_ga=2.47492516.2004553106.1693232324-697922334.1692690893&_gac=1.56894168.1692991461.CjwKCAjwoqGnBhAcEiwAwK-OkVNuVo904scbhiZC4Vj5o7y44vSHJyOTgAsQaSKpG0T3OIIio7R74BoC0u8QAvD_BwE

# view: order_items_rank_ndt {
#   view_label: "Rank order items"
#   derived_table: {
#     explore_source: order_items {
#       column: total_sale_price { field: order_items.total_sale_price }
#       column: brand { field: products.brand }
#       derived_column: row_raw { sql: RANK() OVER (ORDER BY total_sale_price DESC) ;;}
#       bind_all_filters: yes
#       sort: { field: total_sale_price desc: yes}
#     }
#   }

#   dimension: brand { group_label: "Simple Example"  }
#   dimension: row_raw { type: number group_label: "Simple Example" }
#   dimension: brand_ranked {
#     group_label: "Simple Example"
#     order_by_field: rank
#     type: string
#     sql: ${rank} || ') ' || ${brand} ;;
#   }

#   parameter: top_n {
#     type: number
#   }

#   parameter: dimension_criteria {
#     type: string
#     default_value: "Brand"

#     allowed_value: {
#       value: "Brand"
#     }
#     allowed_value: {
#       value: "Category"
#     }
#     allowed_value: {
#       value: "Product Name"
#     }

#   }

#   parameter: measure_criteria {
#     type: string
#     default_value: "Orders"

#     allowed_value: {
#       value: "Orders"
#     }
#     allowed_value: {
#       value: "Store Value"
#     }

#   }

#   dimension: product_attribute {type: string sql: ${TABLE}.brand ;; primary_key: yes}

#   dimension: metric {type: number sql: ${TABLE}.total_sale_price ;;}

#   dimension: rank_raw {type: number sql: ${TABLE}.rown ;;}

#   dimension: rank {type: string sql: case when ${rank_raw}<={% parameter top_n %} then right(concat('00',cast(${rank_raw} as string)), 2) else 'Other' end ;;}

#   dimension: rank_and_brand {type: string sql: case when ${rank}='Other' then 'Other' else ${rank} || '-' || ${product_attribute} end ;;}

#   measure: total_metric {type: sum sql: ${metric} ;; value_format_name: decimal_0}


# }
