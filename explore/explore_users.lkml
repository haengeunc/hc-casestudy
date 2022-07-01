
include: "/views/users.view"

#######################################################
#------------------------------------------------------

explore: users {
  conditionally_filter: {
    filters: [users.created_date: "90 days"]
    unless: [users.id, users.city]
  }
}
