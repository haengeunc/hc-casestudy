- dashboard: modal_button
  title: modal button
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: cjMLDYyrV54PYu0PV7YIWH
  elements:
  - title: How to guide
    name: How to guide
    model: haengeun_case_study
    explore: button_test
    type: single_value
    fields: [button_test.info_icon]
    sorts: [button_test.star_subject_demo]
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
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
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
    note_state: collapsed
    note_display: hover
    note_text: Click to check
    listen: {}
    row: 0
    col: 0
    width: 3
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<button type=\"button\" class=\"btn btn-primary\" data-toggle=\"modal\"\
      \ data-target=\"#myModal\">How to use</button>\n\n<div id=\"myModal\" class=\"\
      modal fade\" role=\"dialog\">\n  <div class=\"modal-dialog modal-lg\">\n   \
      \ <div class=\"modal-content\">\n      <div class=\"modal-header\">\n      \
      \  <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n\
      \        <h4 class=\"modal-title\">Help Center</h4>\n      </div>\n      <div\
      \ class=\"modal-body\">\n        <p>\n          Lorem ipsum dolor sit amet.\
      \ Et labore nesciunt eum quasi eius ut velit nihil qui quod amet est deserunt\
      \ inventore est modi ipsam. Est nesciunt quidem vel libero reprehenderit et\
      \ voluptatem nihil ut cupiditate perferendis qui laborum reprehenderit. Est\
      \ deserunt esse eos sint voluptatum ad natus consequatur sit maxime sint ut\
      \ explicabo neque.\n        </p>\n        <a href=\"#helpcenter\">Go to help\
      \ center</a>\n       \n      </div>\n    </div>\n  </div>\n</div>"
    row: 0
    col: 3
    width: 3
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <!-- Button trigger modal -->
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
        Launch demo modal
      </button>

      <!-- Modal -->
      <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
             <p>
                Lorem ipsum dolor sit amet. Et labore nesciunt eum quasi eius ut velit nihil qui quod amet est deserunt inventore est modi ipsam. Est nesciunt quidem vel libero reprehenderit et voluptatem nihil ut cupiditate perferendis qui laborum reprehenderit. Est deserunt esse eos sint voluptatum ad natus consequatur sit maxime sint ut explicabo neque.
              </p>
              <a href="#helpcenter">Go to help center</a>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
      </div>
    row: 0
    col: 6
    width: 4
    height: 2
  - title: Order Items overview - top 10
    name: Order Items overview - top 10
    model: haengeun_case_study
    explore: order_items
    type: looker_grid
    fields: [order_items.order_id, order_items.total_sale_price]
    sorts: [order_items.total_sale_price desc 0]
    limit: 10
    column_limit: 50
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 3
    col: 0
    width: 8
    height: 6
