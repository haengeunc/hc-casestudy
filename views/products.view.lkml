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
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;

    html:
      {% if _user_attributes['department'] == "Finance" %}
      <p style="color: #5A2FC2; background-color: #E5E5E6; font-size:
      180%; font-weight: bold; text-align:center">{{value}}</p>
      {% else %}
      <p style="color: #166088; background-color: #B3F5F7; font-size:
      180%; font-weight: bold; text-align:center">{{value}}</p>
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
    html:  <p style="color: #166088; background-color: #B3F5F7; font-size: 150%; fontweight: bold; text-align:center">{{value}}</p> ;;
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
