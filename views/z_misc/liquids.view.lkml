explore: liquids {}

view: liquids {
  derived_table: {
    sql:
      SELECT
        '123' AS id
      UNION ALL
      SELECT
        '2345' AS id
      ;;
  }

############### Substring https://shopify.github.io/liquid/tags/control-flow/  ##############################
  dimension: model_name{
    sql: {{ _model._name }};;
  }

  dimension: model_name_len{
    sql: {{ _model._name | size}};;
  }

  dimension: substring {
    sql: {% assign model_name = _model._name %}
          {% assign model_size = model_name.size %}
          {% assign model_size_sub = model_name.size | minus: 15 %}
          {{ _model._name | slice: 9, model_size_sub}}
          ;;
  }

  #########################################################################

}
