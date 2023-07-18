

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

  dimension: user_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    link: {
      label: "Get Directions"
      url: "https://www.google.com/maps/dir/?api=1&destination={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain=maps.google.com"
    }
  }

    dimension: state {
      type: string
      map_layer_name: us_states
      #map_layer_name: hc_map
      sql: ${TABLE}.state ;;
      group_label: "Location"
    }


    dimension: zip {
      type: zipcode
      sql: ${TABLE}.zip ;;
      group_label: "Location"
    }

   #####################################


  dimension: row_level_security {
    type: yesno
    description: "Apply row level security if email matches or part of all data group"
    sql: {{_user_attributes['can_see_all_data']}}
    OR ${email} = "{{_user_attributes['email']}}" ;;
  }



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


#example of creating button and image
  measure: average_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_1
    html:{{rendered_value}}
    <p style="height: 50px"><a style="font-size:10px; padding: 3px 4px 3px 2px; letter-spacing: 0px; border: 1px solid #0042e4;text-align:center;color: #0042e4; background-color: white; " href="https://google.com" target="_blank" rel="noopener noreferrer">
    <img src="https://b-new.be/wp-content/uploads/2020/07/LK.png" height=10 width=14> button </a></p>
    ;;

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
