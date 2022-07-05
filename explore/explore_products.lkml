
include: "/views/products.view"
include: "/views/distribution_centers.view"

#######################################################
#------------------------------------------------------


explore: products {
  label: "Explore products"
  description: "To analyse data related to products and distribution centers"


 join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}
