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
      url: "https://sandbox.looker.haengeun.com/dashboards/3?Category={{_filters['products.category']|url_encode}}&Brand={{ value | url_encode}}"
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

  dimension: brand_display {
    view_label: "Item"
    type: string
    sql: ${brand} ;;
    html: {% if brand._value == "Gap" %} <img src="https://i.ibb.co/t8BH0H9/6596980-preview.png" width="135px" height="auto">
          {% elsif brand._value == 'Calvin Klein' %} <img src="https://i.ibb.co/P6b0MtJ/webb-banks-brand-titos-handmade-vodka2a.png"  width="135px" height="auto">
          {% elsif brand._value == 'Coach' %} <img src="https://i.ibb.co/W6HF88z/download.png" width="135px" height="auto">
          {% elsif brand._value == '180s' %} <img src="https://i.ibb.co/tLWGc8n/looker-logo.png"  width="135px" height="auto">
          {% elsif brand._value == 'Hawkeye' %} <img src="https://i.ibb.co/R6Gt3YG/10932-1.png" width="135px" height="auto">
          {% elsif brand._value == 'Hennessy' %} <img src="https://i.ibb.co/bQQtJvQ/hennessy-logo-black-and-white.png" width="135px" height="auto">
          {% elsif brand._value == 'Jack Daniels' %} <img src="https://i.ibb.co/z7BXsxZ/jack-daniels-logo-png-1.png"  width="135px" height="auto">
          {% elsif brand._value == 'Smirnoff' %} <img src="https://i.ibb.co/hc6VwKx/6779046-preview.png"  width="135px" height="auto">
          {% else %} {{value}}
          {% endif %} ;;
  }

  # dimension: brand_display {
  #   view_label: "Item"
  #   type: string
  #   sql: ${brand} ;;
  #   html: {% if brand._value == "Captain Morgan" %} <img src="https://i.ibb.co/t8BH0H9/6596980-preview.png" width="135px" height="auto">
  #         {% elsif brand._value == 'Titos' %} <img src="https://i.ibb.co/P6b0MtJ/webb-banks-brand-titos-handmade-vodka2a.png"  width="135px" height="auto">
  #         {% elsif brand._value == 'Crown Royal' %} <img src="https://i.ibb.co/dtBpYsT/crown-royal-logo.png" width="135px" height="auto">
  #         {% elsif brand._value == 'Fireball' %} <img src="https://i.ibb.co/sH8RxtT/6759031-preview.jpg"  width="135px" height="auto">
  #         {% elsif brand._value == 'Hawkeye' %} <img src="https://i.ibb.co/R6Gt3YG/10932-1.png" width="135px" height="auto">
  #         {% elsif brand._value == 'Hennessy' %} <img src="https://i.ibb.co/bQQtJvQ/hennessy-logo-black-and-white.png" width="135px" height="auto">
  #         {% elsif brand._value == 'Jack Daniels' %} <img src="https://i.ibb.co/z7BXsxZ/jack-daniels-logo-png-1.png"  width="135px" height="auto">
  #         {% elsif brand._value == 'Smirnoff' %} <img src="https://i.ibb.co/hc6VwKx/6779046-preview.png"  width="135px" height="auto">
  #         {% else %} {{value}}
  #         {% endif %} ;;
  # }

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

  parameter: retail_price_bucket_size {
    type: number
  }

  dimension: retail_dynamic_price_group {
    type: number
    sql: TRUNC(${retail_price} / {% parameter ${retail_price_bucket_size}%},0)
    * {% parameter ${retail_price_bucket_size}%} ;;
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

  dimension: navigation_buttons {
    type: yesno
    allow_fill: yes
    sql: true ;;


    # {% if _explore._dashboard_url contains 'dashboard' %}
    html:
    {% if _explore._dashboard_url contains '/embed/' %}

      <div>
        <a style="@{navigation_buttons_style_3}}" href="/embed/dashboards-next/1?@{navigation_buttons_filters}" target="_blank">Customer Behaviour - embed </a>
        <a style="@{navigation_buttons_style_2}" href="/embed/dashboards-next/2?@{navigation_buttons_filters}" target="_blank">Summary</a>
        <a style="@{navigation_buttons_style_2}" href="/embed/dashboards-next/3?@{navigation_buttons_filters}" target="_blank">Brand comparison</a>
      </div>

      {% else %}

      <div>
        <a style="@{navigation_buttons_style_3}}" href="/dashboards-next/1?@{navigation_buttons_filters}" target="_blank">Customer Behaviour - no embed</a>
        <a style="@{navigation_buttons_style_2}" href="/dashboards-next/2?@{navigation_buttons_filters}" target="_blank">Summary</a>
        <a style="@{navigation_buttons_style_2}" href="/dashboards-next/3?@{navigation_buttons_filters}" target="_blank">Brand comparison</a>
      </div>

      {% endif %} ;;
  }


  dimension: url_show{
    type: string
    html:  check {{ _view._name }} ;;
    sql: 1;;
    }



  dimension: navigation_buttons_link {
    type: yesno
    allow_fill: yes
    sql: true ;;

    link: {
      url:"/dashboards-next/1?@{navigation_buttons_filters}"
      label: "Customer Behaviour"
    }
  }


  dimension: navigation_buttons_brand_product {
    type: yesno
    allow_fill: yes
    sql: true ;;
    html:
      <div>
        <a style="display: table; text-align:center; margin: 0 auto; color: #fff; background-color: #4285F4; border-color: #4285F4; float: left; font-weight: 400; text-align: center; vertical-align: middle; cursor: pointer; user-select: none; padding: 10px; margin: 5px; font-size: 1rem; line-height: 1.5; border-radius: 5px;" href="/dashboards-next/1?Category={{ _filters['products.category'] | url_encode }}&Brand={{ _filters['products.brand'] | url_encode }}">Customer Behaviour</a>
        <a style="display: table; text-align:center; margin: 0 auto; color: #fff; background-color: #4285F4; border-color: #4285F4; float: left; font-weight: 400; text-align: center; vertical-align: middle; cursor: pointer; user-select: none; padding: 10px; margin: 5px; font-size: 1rem; line-height: 1.5; border-radius: 5px;" href="/dashboards-next/2?Category={{ _filters['products.category'] | url_encode }}&Brand={{ _filters['products.brand'] | url_encode }}">Summary</a>
        <a style="display: table; text-align:center; margin: 0 auto; color: #fff; background-color: #4285F4; border-color: #4285F4; float: left; font-weight: 400; text-align: center; vertical-align: middle; cursor: pointer; user-select: none; padding: 10px; margin: 5px; font-size: 1rem; line-height: 1.5; border-radius: 5px;" href="/dashboards-next/3?Category={{ _filters['products.category'] | url_encode }}&Brand={{ _filters['products.brand'] | url_encode }}">Brand comparison</a>
      </div>
    ;;
  }

  dimension: navigation_buttons_brand_product_link {
    type: yesno
    allow_fill: yes
    sql: true ;;
    link: {
      url:"/dashboards-next/1?Category={{ _filters['products.category'] | url_encode }}&Brand={{ _filters['products.brand'] | url_encode }}"
      label: "navigation"
    }
  }





}
