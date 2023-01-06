# release on git as production -16:58 - 25 Jul 2022 - 10:19 - 10.25 - xxx
project_name: "haengeun_case_study"

constant: environment {
  value: "thelook"
  export: override_required
}

#using constant variable allows multi staging in a single instance
constant: model_connection {
  value: "thelook_bq"

}

#formatting shorten 0's using constant
constant: currency_value_format_liquid {
  value: "
  {% if value >=1000000 %}
  ${{ value | divided_by: 1000000 | round: 2 }} M
  {% elsif value >=1000 %}
  ${{ value | divided_by: 1000 | round: 2 }} K
  {% elsif value >0 %}
  ${{ value | divided_by: 1 | round: 2 }}
  {% endif %}"
}

constant: two_decimal_format {
  value: "0.##"
}


constant: usd_1 {
  value: "$0.0"
}

constant: large_order_threshold {
  value: "1000"
}
