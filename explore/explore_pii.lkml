
include: "/views/users/users.view"
include: "/views/z_misc/students.view.lkml"



####################################################### this exlore is for users related analysis
#------------------------------------------------------

explore: explore_pii {
  from: users



    # join: students {
    #   type: left_outer
    #   sql_on: ${users.id} = ${students.student_id} ;;
    #   relationship: one_to_one
    # }


# sql_always_where: ${students.email} in {{_user_attributes['email']}};;

}
