view: distribution_centers {
  sql_table_name: `thelook.distribution_centers`;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
    group_label: "Location"

  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
    group_label: "Location"

  }

  dimension: location {
    label: "Distribution centre location"
    group_label: "Location"
    type:  location
    sql_latitude: ${latitude} ;;
    sql_longitude:  ${longitude} ;;
  required_access_grants: [can_view_financial_data]
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }


#---------------------------------------------------------
  measure: count {
    label: "Count of Distribution Centre ID"
    type: count
    drill_fields: [id, name, products.count]
  }
}


#---------------------------------------------------------
