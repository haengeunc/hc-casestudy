
include: "/views/products/products.view"
include: "/views/products/distribution_centers.view"

#######################################################
#------------------------------------------------------


explore: products {

  description: "To analyse data related to products and distribution centers"

  # #row level security
  # access_filter: {
  #   field: products.department
  #   user_attribute: allowed_departments
  # }




 join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one

  }
}
