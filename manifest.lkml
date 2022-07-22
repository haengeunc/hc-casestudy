project_name: "haengeun_case_study"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }


constant: environment {
  value: "abc"
  export: override_required
}

constant: model_connection {
  value: "thelook_bq"
}
