
include: "/views/users/users.view"
include: "/views/z_misc/students.view.lkml"



####################################################### this exlore is for users related analysis
#------------------------------------------------------

explore: explore_pii {
  # from: users
  view_name: "users"


  # view_name: "students"
  # join: users {

    join: students {
      type: left_outer
      sql_on: ${users.id} = ${students.student_id} ;;
      relationship: one_to_one
    }


sql_always_where: ${students.row_level_security}

;;

# ${students.email} in ("{{_user_attributes['email']}}");;

#   access_filter: {
#     field: users.country
#     user_attribute: country
#   }




  # required_access_grants: [is_pii_viewer]
  #AND {{_user_attributes['is_pii_viewer']}} = "Yes"



  # {% {{_user_attributes['is_pii_viewer']}} == "Yes" %}





  # required_access_grants: [is_pii_viewer]

  # access_grant: is_pii_viewer {
  #   user_attribute: is_pii_viewer
  #   allowed_values: ["Yes"]   }

}
