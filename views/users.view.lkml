view: users {
  sql_table_name: `thelook.users`
    ;;
  drill_fields: [id]

#####################################
#-----DIMENSIONS---------------------


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  #Number of days/weeks/months/years since user created
  dimension_group: since_signup {
    type:  duration
    intervals: [
      day,
      week,
      month,
      year
    ]
    sql_start: ${created_date} ;;
    sql_end: current_date ;;

  }

  # New customers = any users that have signed up on the website within the last 90 days
  dimension: is_new_customer {
    type: yesno
    sql: ${days_since_signup} <= 90 ;;
  }


  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }


  dimension: full_name {
    type: string
    sql: ${first_name} || " " || ${last_name} ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

#####################################
#-----MEASURES------------------------


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      order_items.count,
      order_items_final.count,
      orders.count,
      events.count,
      order_items_test.count,
      order_items_test2.count
    ]
  }
}
