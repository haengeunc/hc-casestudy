include: "/views/pop_parameters.view.lkml"


#https://github.com/llooker/period_over_period_analysis/blob/master/bigquery/views/method_3.view.lkml
explore: pop_parameters {
  label: "Period-over-period"
  description:"PoP Method 3: Custom choice of current and previous periods with parameters"

  fields: [ALL_FIELDS*,
    -pop_parameters.count_returned_items,
    -pop_parameters.masked_sale_price,
    -pop_parameters.average_gross_margin,
    -pop_parameters.gross_margin,
    -pop_parameters.average_sale_price,
    -pop_parameters.count_item_with_status,
    -pop_parameters.count_item_sold,
    -pop_parameters.count_customer_with_returned_items,
    -pop_parameters.count_returned_items,
    -pop_parameters.total_sale_price_complete,
    -pop_parameters.percent_customer_with_returns,
    -pop_parameters.percent_item_returned,
    -pop_parameters.gross_margin_percent,
    -pop_parameters.total_gross_margin]

  always_filter: {
    filters: [current_date_range: "6 months", compare_to: "Year" ]
  }
}
