
view: master_date_field {
  derived_table: {
    sql: SELECT DATE_ADD('2020-01-01',INTERVAL param DAY) AS calendar_date
      FROM unnest(GENERATE_ARRAY(0, 2000, 1)) as param
       ;;
  }



  dimension: calendar_date {
    type: date
    datatype: date
    sql: ${TABLE}.calendar_date ;;
  }

}
