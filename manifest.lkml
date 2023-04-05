# release on git as production -16:58 - 25 Jul 2022 - 10:19 - 10.25 - xxx


project_name: "haengeun_case_study"

constant: environment {
  value: "thelook"
  export: override_required
}

#using constant variable allows multi staging in a single instance
constant: model_connection {
  value: "thelook_bq"

}

#formatting shorten 0's using constant
constant: currency_value_format_liquid {
  value: "
  {% if value >=1000000 %}
  ${{ value | divided_by: 1000000 | round: 2 }} M
  {% elsif value >=1000 %}
  ${{ value | divided_by: 1000 | round: 2 }} K
  {% elsif value >0 %}
  ${{ value | divided_by: 1 | round: 2 }}
  {% endif %}"
}

constant: two_decimal_format {
  value: "0.##"
}


constant: usd_1 {
  value: "$0.0"
}

constant: large_order_threshold {
  value: "1000"
}

constant: navigation_buttons_filters {
  value: "Category={{ _filters['products.category'] | url_encode }}&Brand={{ _filters['products.brand'] | url_encode }}"
}

constant: navigation_buttons_style {
  value: "display: table; text-align:center; margin: 0 auto; color: #fff;
  background-color: #4215F4; border-color: #4215F4;
  float: left; font-weight: 400; text-align: center; vertical-align: middle;
  cursor: pointer; user-select: none; padding: 10px; margin: 5px; font-size: 1rem;
  line-height: 1.5; border-radius: 5px;"
}


constant: navigation_buttons_style_2 {
  value: "padding: 5px 20px; font-size: 20px; border-bottom: solid 1px #0066FF; float: left; line-height: 40px;"
}

constant: navigation_buttons_style_3 {
  value: "padding: 5px 20px; font-size: 20px; border-top: solid 1px #0066FF; border-left: solid 1px #0066FF; border-right: solid 1px #0066FF; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #FFFFFF;"
}




# "padding: 5px 20px; border-top: solid 1px #0066FF; border-left: solid 1px #0066FF; border-right: solid 1px #0066FF; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #FFFFFF;"" href=""#""> Accesses </a>

# <a style=""padding: 5px 20px; border-bottom: solid 1px #0066FF; float: left; line-height: 40px;"" href=""https://telefonica.cloud.looker.com/dashboards/1618"" > B2C KPIs </a>

# <a style=""padding: 5px 20px; border-bottom: solid 1px #0066FF; float: left; line-height: 40px;"" href=""https://telefonica.cloud.looker.com/dashboards/1619"" > B2B KPIs </a>

# </nav>

# </div>"


remote_dependency: bqo {
  url: "https://github.com/sam-pitcher/bq_optimization_lookml"
  ref: "master"
}
