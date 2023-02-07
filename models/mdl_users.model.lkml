connection: "thelook_bq"

include: "/explore/explore_users"

map_layer: hc_map {
  file: "/maps/hc_map.json"
  format: topojson
  property_key: ""
}
