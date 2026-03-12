#how to pair with mapping table with Looker user attributes to manage row level security


view: user_brand_access {
  derived_table: {
    sql: select 'haengeun@google.com' as user_id
    , 'Calvin Klein' as brand
    union all
    select 'haengeun@google.com' as user_id
    , 'Acura' as brand
    union all
    select 'haengeun+test@google.com' as user_id
    , 'Allegra K' as brand

    ;;



    datagroup_trigger: datagroup_daily_refresh
  }

  dimension: brand {
    sql: ${brand} ;;
  }



}
