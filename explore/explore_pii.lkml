
include: "/views/users/users.view"
include: "/views/master_security.view.lkml"



####################################################### this exlore is for users related analysis
#------------------------------------------------------

explore: users {
 label: "explore_pii"


  join: master_security {
    type: left_outer
    sql_on: ${master_security.student_id} = ${users.id} ;;
    relationship: one_to_one
  }


  # sql_always_where: ${master_security.email} in ("{{_user_attributes['email']}}") ;;


  # required_access_grants: [is_pii_viewer]
  #AND {{_user_attributes['is_pii_viewer']}} = "Yes"



  # {% {{_user_attributes['is_pii_viewer']}} == "Yes" %}


  access_filter: {
    field: users.country
    user_attribute: country
  }



  # required_access_grants: [is_pii_viewer]

  # access_grant: is_pii_viewer {
  #   user_attribute: is_pii_viewer
  #   allowed_values: ["Yes"]   }

}
