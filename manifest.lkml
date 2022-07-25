# release on git as production -16:58 - 25 Jul 2022 - 10:19 - 10.25
project_name: "haengeun_case_study"

constant: environment {
  value: "thelook"
  export: override_required
}

#using constant variable allows multi staging in a single instance
constant: model_connection {
  value: "thelook_bq"
}
