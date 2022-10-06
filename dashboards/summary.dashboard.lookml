- dashboard: summary
  title: Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: fgR5ATZuev5ivjP6k0acM0
  elements:
  - name: HC ideas
    type: text
    title_text: HC ideas
    subtitle_text: ''
    body_text: |-
      WHAT? Factors driving revenue/profitability / number of return customers

      - product name/brand/category/department
      - Price?
      - Location
      - Time of delivery?
      - Traffic Source?

      WHY?
      - More effective marketing strategy?
      - Target marketing campaigns?
      - Understand reason behind lower return rate
    row: 42
    col: 0
    width: 7
    height: 6
  - type: button
    name: button_43
    rich_content_json: '{"text":"Customer Behaviour","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://sandbox.looker.haengeun.com/dashboards/1?Category=&Status="}'
    row: 0
    col: 20
    width: 4
    height: 1
  - type: button
    name: button_44
    rich_content_json: '{"text":"Brand Comparisons","description":"","newTab":true,"alignment":"center","size":"medium","style":"FILLED","color":"#1A73E8","href":"https://sandbox.looker.haengeun.com/dashboards/3?Category=&Brand="}'
    row: 1
    col: 20
    width: 4
    height: 1
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <h3>Fashion.ly Summary Dashboard</h3>

      <img src="https://logo-core.clearbit.com/looker.com" width="8%">
    row: 0
    col: 0
    width: 20
    height: 4
  - title: Revenue by age group and gender
    name: Revenue by age group and gender
    model: haengeun_case_study
    explore: order_items
    type: looker_column
    fields: [users.age_group, order_items.total_sale_price_complete, users.gender]
    pivots: [users.gender]
    fill_fields: [users.age_group]
    sorts: [users.age_group, users.gender]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: New Calculation, value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_of_column_sum, table_calculation: new_calculation,
        args: [order_items.total_sale_price_complete], _kind_hint: measure, _type_hint: number}]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    series_types: {}
    series_colors: {}
    series_labels: {}
    defaults_version: 1
    hidden_fields: [new_calculation]
    value_labels: legend
    label_type: labPer
    hidden_points_if_no: []
    show_null_points: true
    interpolation: linear
    note_state: collapsed
    note_display: hover
    note_text: The customers in the demographic of age group 36-50 generate the most
      revenue for the company
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 13
    col: 0
    width: 12
    height: 8
  - title: Revenue & Gross Margin over 12 months
    name: Revenue & Gross Margin over 12 months
    model: haengeun_case_study
    explore: order_items
    type: looker_column
    fields: [order_items.created_month, order_items.total_sale_price, order_items.gross_margin_percent]
    fill_fields: [order_items.created_month]
    sorts: [order_items.created_month]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'mean(offset_list(${order_items.total_sale_price},-6,7))',
        label: Rolling Average Revenue, value_format: !!null '', value_format_name: gbp,
        _kind_hint: measure, table_calculation: rolling_average_revenue, _type_hint: number,
        is_disabled: true}, {category: table_calculation, expression: 'mean(offset_list(${order_items.total_gross_margin},-6,7))',
        label: Rolling Average Margin, value_format: !!null '', value_format_name: gbp,
        _kind_hint: measure, table_calculation: rolling_average_margin, _type_hint: number,
        is_disabled: true}]
    filter_expression: |-
      #order date placed within the last 12 months

      (diff_months(${order_items.created_date}, now()) < 13)

      AND

      #excluding current month
      (diff_months(${order_items.created_date}, now()) > 0)
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
    point_style: circle
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: order_items.gross_margin_percent,
            id: order_items.gross_margin_percent, name: Gross Margin %}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_label: Order placed month
    hidden_series: [users.count]
    series_types:
      order_items.gross_margin_percent: line
    series_colors: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Gross Margin % over the Past 30 Days
    name: Gross Margin % over the Past 30 Days
    model: haengeun_case_study
    explore: order_items
    type: single_value
    fields: [order_items.average_spend_per_customer]
    filters:
      order_items.created_date: 30 days
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Spend per Customer over the Past 30 Days
    value_format: ''
    defaults_version: 1
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 4
    col: 10
    width: 5
    height: 2
  - title: Revenue by new vs old customers (90 days)
    name: Revenue by new vs old customers (90 days)
    model: haengeun_case_study
    explore: order_items
    type: looker_area
    fields: [order_items.total_sale_price, users.is_new_customer, order_items.created_date]
    pivots: [users.is_new_customer]
    fill_fields: [users.is_new_customer, order_items.created_date]
    filters:
      order_items.created_date: 90 days
    sorts: [users.is_new_customer desc, order_items.created_date desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Daily Revenue, orientation: left, series: [{axisId: order_items.total_sale_price,
            id: No - order_items.total_revenue, name: 'No'}, {axisId: order_items.total_revenue,
            id: Yes - order_items.total_sale_price, name: 'Yes'}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Orde Date
    hidden_series: []
    series_types: {}
    series_labels:
      Yes - order_items.total_sale_price: New Customer
      No - order_items.total_sale_price: Old customer
    ordering: none
    show_null_labels: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Royal customer generate more revenue, compared to the new customers
      - strategy should focus on increasing loyal customers
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 13
    col: 12
    width: 12
    height: 8
  - title: New Tile
    name: New Tile
    model: haengeun_case_study
    explore: order_items
    type: single_value
    fields: [order_items.created_date, users.count]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 2 days
      users.is_new_customer: 'Yes'
    sorts: [order_items.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: "% change from previous\
          \ day", value_format: !!null '', value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: change_from_previous_day, args: [users.count], _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
    custom_color: "#4A80BC"
    single_value_title: Total new users signed up yesterday
    value_format: ''
    comparison_label: "% change from yesterday"
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 4
    col: 5
    width: 5
    height: 2
  - title: Gross Margin % over the Past 30 Days
    name: Gross Margin % over the Past 30 Days (2)
    model: haengeun_case_study
    explore: order_items
    type: single_value
    fields: [order_items.gross_margin_percent, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 30 days
    sorts: [order_items.created_date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Gross Margin % over the Past 30 Days
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 4
    col: 15
    width: 5
    height: 2
  - title: New User Created over time
    name: New User Created over time
    model: haengeun_case_study
    explore: order_items
    type: looker_line
    fields: [users.created_month, users.count]
    fill_fields: [users.created_month]
    filters:
      users.created_month: before 1 months ago
    sorts: [users.created_month desc]
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Number of customers, orientation: left, series: [{axisId: users.count,
            id: users.count, name: Count of Users}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: User created month
    trend_lines: [{color: "#61A9A5", label_position: right, order: 3, period: 7, regression_type: polynomial,
        series_index: 1, show_label: false}]
    defaults_version: 1
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 21
    col: 12
    width: 12
    height: 8
  - title: Revenue Yearly Trends
    name: Revenue Yearly Trends
    model: haengeun_case_study
    explore: order_items
    type: looker_column
    fields: [order_items.created_year, order_items.total_sale_price]
    fill_fields: [order_items.created_year]
    filters: {}
    sorts: [order_items.created_year desc]
    limit: 500
    column_limit: 50
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
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    y_axes: [{label: Revenue, orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Year
    series_types: {}
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 6
    col: 0
    width: 12
    height: 7
  - title: Top 10 Products by Revenue
    name: Top 10 Products by Revenue
    model: haengeun_case_study
    explore: order_items
    type: looker_grid
    fields: [order_items.gross_margin_percent, order_items.total_sale_price, products.brand]
    filters:
      order_items.total_sale_price: ''
    sorts: [order_items.total_sale_price desc]
    limit: 10
    dynamic_fields: [{category: table_calculation, expression: "(${order_items.total_sale_price}\
          \ / sum(${order_items.total_sale_price}))", label: "% of Total Revenue",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: of_total_sale_price, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", products.brand, order_items.total_sale_price,
      of_total_revenue, order_items.gross_margin_percent]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      of_total_sale_price: 260
    series_cell_visualizations:
      order_items.gross_margin_percent:
        is_active: false
      order_items.total_sale_price:
        is_active: true
      of_total_sale_price:
        is_active: false
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 21
    col: 0
    width: 12
    height: 8
  - title: Profitability by Location
    name: Profitability by Location
    model: haengeun_case_study
    explore: order_items
    type: looker_map
    fields: [order_items.total_gross_margin, users.location, users.state]
    sorts: [order_items.total_gross_margin desc]
    limit: 500
    total: true
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map: auto
    map_projection: ''
    quantize_colors: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 36
    col: 0
    width: 12
    height: 6
  - title: Top 10 Categories by Revenue
    name: Top 10 Categories by Revenue
    model: haengeun_case_study
    explore: order_items
    type: looker_grid
    fields: [order_items.gross_margin_percent, order_items.total_sale_price, products.category]
    filters:
      order_items.total_sale_price: ''
    sorts: [order_items.total_sale_price desc]
    limit: 10
    dynamic_fields: [{category: table_calculation, expression: "(${order_items.total_sale_price}\
          \ / sum(${order_items.total_sale_price}))", label: "% of Total Revenue",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: of_total_sale_price, _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", products.category, order_items.total_sale_price,
      of_total_revenue, order_items.gross_margin_percent]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      of_total_sale_price: 260
    series_cell_visualizations:
      order_items.gross_margin_percent:
        is_active: false
      order_items.total_sale_price:
        is_active: true
      of_total_sale_price:
        is_active: false
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 29
    col: 0
    width: 12
    height: 7
  - title: New Tile
    name: New Tile (2)
    model: haengeun_case_study
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.created_date]
    fill_fields: [order_items.created_date]
    filters:
      order_items.created_date: 5 days
    sorts: [order_items.created_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: "% change from previous\
          \ day", value_format: !!null '', value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: change_from_previous_day, args: [order_items.total_sale_price],
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
    custom_color: "#4A80BC"
    single_value_title: Total Revenue Yesterday
    value_format: ''
    comparison_label: change from previous day
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [order_items.created_date]
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 4
    col: 0
    width: 5
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: haengeun_case_study
    explore: order_items
    type: single_value
    fields: [order_items.Current_Date]
    fill_fields: [order_items.Current_Date]
    sorts: [order_items.Current_Date desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Current Date
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 2
    col: 20
    width: 4
    height: 2
  - title: Profitability USA vs UK
    name: Profitability USA vs UK
    model: haengeun_case_study
    explore: order_items
    type: looker_pie
    fields: [order_items.total_gross_margin, users.country]
    sorts: [order_items.total_gross_margin desc 0]
    limit: 500
    total: true
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_colors: {}
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
    series_types: {}
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      order_items.total_gross_margin:
        is_active: true
      order_items.total_sale_price:
        is_active: true
      order_items.count:
        is_active: true
      order_items.average_spend_per_customer:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    show_null_points: true
    hide_totals: false
    hide_row_totals: false
    map: auto
    map_projection: ''
    quantize_colors: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 29
    col: 18
    width: 6
    height: 7
  - title: Profitability by Location
    name: Profitability by Location (2)
    model: haengeun_case_study
    explore: order_items
    type: looker_grid
    fields: [order_items.total_gross_margin, users.state, users.country]
    sorts: [order_items.total_gross_margin desc 0]
    limit: 500
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    map: auto
    map_projection: ''
    quantize_colors: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields:
    listen:
      Created Year: order_items.created_year
      Category: products.category
    row: 29
    col: 12
    width: 6
    height: 7
  filters:
  - name: Created Year
    title: Created Year
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: haengeun_case_study
    explore: order_items
    listens_to_filters: []
    field: order_items.created_year
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: haengeun_case_study
    explore: order_items
    listens_to_filters: []
    field: products.category