

#Dashboard used to examine customer behavior and purchasing patterns in order to improve their marketing and sales efforts

- dashboard: customer_behaviour
  title: Customer Behaviour
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: z5pKro1QtDsh6PNyc3Mu0z
  elements:
  - title: Customers distribution based on total orders
    name: Customers distribution based on total orders
    model: haengeun_case_study
    explore: order_items
    type: looker_column
    fields: [order_items_derived.customer_lifetime_orders_group, order_items_derived.count]
    fill_fields: [order_items_derived.customer_lifetime_orders_group]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items_derived.count,
            id: order_items_derived.count, name: Order Items Derived}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_colors: {}
    reference_lines: []
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 10
    height: 10
  - title: Customers distribution based on total revenue
    name: Customers distribution based on total revenue
    model: haengeun_case_study
    explore: order_items
    type: looker_column
    fields: [order_items_derived.customer_lifetime_revenue_group, order_items_derived.count]
    fill_fields: [order_items_derived.customer_lifetime_revenue_group]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_datetime_label: ''
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 10
    height: 7
