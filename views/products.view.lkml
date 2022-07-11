view: products {
  sql_table_name: `thelook.products`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    label: "Product ID"
    sql: ${TABLE}.id ;;
  }

#----------------------------------------------------------
#-------Create external links to navigate to explore/google/dashboard
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;

    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
      }
    link: {
      label: "Facebook"
      url: "https://www.facebook.com/{{value}}/"
      icon_url: "https://facebook.com/favicon.ico"
    }
    link: {
      label: "Order Items Explore"
      url: "https://sandbox.looker.haengeun.com/explore/haengeun_case_study/order_items?fields=order_items.count,users.count,products.brand&f[products.brand]={{ value }}&sorts=order_items.count_order+desc+0&limit=500"
    }
    link: {
      label: "Brand Comparisons Dashboard"
      url: "https://sandbox.looker.haengeun.com/dashboards/3?Category={{_filters['products.category']|url_encode}}&Brand+Select={{ value | url_encode}}"
    }
  }

#----------------------------------------------------------

  dimension: brands_other {
    type: string
    sql: CASE WHEN {% condition brand_select %} ${products.brand} {% endcondition %} THEN ${products.brand}
              ELSE 'All other Brands'
          END;;
  }

  filter: brand_select {
    type: string
    suggest_explore: explore_order_items
    suggest_dimension: brand
  }

#----------------------------------------------------------
#create a dynamic measure using a liquid parameter
  measure: category_count {
    type: sum
    sql: CASE WHEN ${category} = '{% parameter category_to_count %}'
              THEN 1
              ELSE 0
          END
        ;;
  }

  #using type "string" will cause it to error when SQL generated as double single quotes get generated
  parameter: category_to_count {
    type: unquoted
  }
#----------------------------------------------------------


  measure: category_count_dynamic2{
    type: number
    sql: SUM(${category}) WHERE {% condition category %} category {% endcondition%} ;;
  }





  dimension: category {
    type: string
    sql: ${TABLE}.category ;;

    link: {
      label: "Brand Comparisons Dashboard"
      url: "https://sandbox.looker.haengeun.com/dashboards/3?Category={{ value |url_encode}}&Brand={{ _filters['products.brand'] | url_encode}}"
    }

    html:
      {% if _user_attributes['department'] == "Finance" %}
      <p style="color: #5A2FC2; background-color: #E5E5E6; font-size:
      100%; font-weight: bold; text-align:center">{{value}}</p>
      {% else %}
      <p style="color: #166088; background-color: #B3F5F7; font-size:
      100%; font-weight: bold; text-align:center">{{value}}</p>
      {% endif %}
            ;;




  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
    html:  <p style="color: #166088; background-color: #B3F5F7; font-size: 100%; fontweight: bold; text-align:center">{{value}}</p> ;;
  }

  dimension: distribution_center_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    html: <b><center>{{value}}</centre></b> ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: retail_price_group {
    type: tier
    sql: ${retail_price} ;;
    tiers: [0,50,100,150,200,250,300]
    style:  integer
  }


  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    label: "Count of products"
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }

  measure: gross_margin {
    type: sum
    sql: ${retail_price} - ${cost} ;;
    value_format_name: gbp
  }


}
