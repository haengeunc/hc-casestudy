explore: users_b {}

view: cte_replacement {

  derived_table: {

    sql:
    SELECT
    '123' AS id
    UNION ALL
    SELECT
    '2345' AS id
    ;;

  }

}

view: users_b {

  derived_table: {

    sql: SELECT * FROM ${cte_replacement.SQL_TABLE_NAME} ;;

  }

  dimension: id {
    sql: ${TABLE}.id ;;
  }

}
