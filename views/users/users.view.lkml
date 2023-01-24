view: users {
  sql_table_name: `thelook.users`
    ;;
  drill_fields: [id]


#####################################
#-----DIMENSIONS---------------------


  dimension: id {
    primary_key: yes
    type: number
    label: "User ID"
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_group {
    type: tier
    tiers: [20, 40, 60, 80]
    style:  integer
    sql: ${age} ;;
  }


  parameter: age_tier_bucket_size {
    type: number
  }

  dimension: dynamic_age_tier {
    type: number
    sql: TRUNC(${age} / {% parameter age_tier_bucket_size %}, 0)
      * {% parameter age_tier_bucket_size %} ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    group_label: "Location"

  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    group_label: "Location"
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
    description: "Yes means the user signed up within the last 90 days"
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
    group_label: "Name"
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    group_label: "Name"
  }


  dimension: full_name {
    type: string
    sql: ${first_name} || " " || ${last_name} ;;
    group_label: "Name"
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  #####################################

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
      label: "User location"
      type:  location
      sql_latitude: ${latitude};;
      sql_longitude: ${longitude} ;;
      group_label: "Location"
    }

    dimension: state {
      type: string
      map_layer_name: us_states
      sql: ${TABLE}.state ;;
      group_label: "Location"
    }


    dimension: zip {
      type: zipcode
      sql: ${TABLE}.zip ;;
      group_label: "Location"
    }

   #####################################


#####################################
#-----MEASURES------------------------


  measure: count {
    label: "Count of Users"
    type: count
    drill_fields: [detail*]
  }

  measure: average_number_of_days_since_signup {
    type:  average
    sql: ${days_since_signup}  ;;
  }

  measure: average_number_of_months_since_signup {
    type:  average
    sql: ${months_since_signup}  ;;
  }

  measure: count_new_user {
    type: count
    filters: [is_new_customer: "Yes"]
  }




  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      last_name,
      first_name,
      order_items.count,
      orders.count,
      events.count,
    ]
  }
}
