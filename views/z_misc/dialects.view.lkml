explore: dialects {}

view: dialects {

  derived_table: {
    sql:
      SELECT
        '123' AS id
      UNION ALL
      SELECT
        '2345' AS id
      ;;
  }

  dimension: dashboard_id {
    sql: ${TABLE}.id ;;
  }

  dimension: model_dialect {
    type: string
    html: {{_dialect._name}} ;;
    sql: 1 ;;
  }


  dimension: real_dash_id {
    label: "Dashboard ID (Inclusive)"
    description: "The unique string identifier for either a user-defined or a LookML dashboard"
    type: string
    sql:
      {% if _dialect._name == 'hypersql' %}
        COALESCE(${dashboard_id}, CONVERT(${dashboard_id}, SQL_VARCHAR))
      {% elsif _dialect._name == 'bigquery_standard_sql' %}
        COALESCE(${dashboard_id}, CAST(${dashboard_id} AS STRING))
      {% else %}
        COALESCE(${dashboard_id}, CAST(${dashboard_id} AS CHAR(256)))
      {% endif %};;
  }


  }
