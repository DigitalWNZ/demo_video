- dashboard: wangez_video_demo
  title: wangez_video_demo
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Rental Percentage by File Category
    name: Rental Percentage by File Category
    model: demo_video
    explore: rental
    type: looker_column
    fields: [rental_percentage.avg_rental_pert, category.name]
    sorts: [category.name]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 14
    col: 0
    width: 24
    height: 8
  - title: Rental Interval by Customer
    name: Rental Interval by Customer
    model: demo_video
    explore: rental
    type: looker_grid
    fields: [rental_interval.customer_id, rental_interval.avg_length, customer.email]
    sorts: [rental_interval.avg_length desc]
    limit: 500
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
    listen:
      Rental Date Date: rental.rental_date
    row: 22
    col: 0
    width: 24
    height: 8
  - title: LTV
    name: LTV
    model: demo_video
    explore: rental
    type: looker_grid
    fields: [payment.sum_payment, payment.customer_id, customer.email]
    sorts: [payment.sum_payment desc]
    limit: 500
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
    listen:
      Rental Date Date: payment.last_update_date
    row: 30
    col: 0
    width: 24
    height: 7
  - title: payment_tier
    name: payment_tier
    model: demo_video
    explore: rental
    type: looker_pie
    fields: [payment_tier.payment_tier, payment_tier.count]
    fill_fields: [payment_tier.payment_tier]
    sorts: [payment_tier.payment_tier]
    limit: 500
    value_labels: legend
    label_type: labPer
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
    listen:
      Rental Date Date: payment.last_update_date
    row: 4
    col: 0
    width: 24
    height: 6
  - name: "<span class='fa fa-asterisk'> Operation Section </span>"
    type: text
    title_text: "<span class='fa fa-asterisk'> Operation Section </span>"
    subtitle_text: "<p> Detail Operation Data</p>"
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-globe'> Executive Section </span>"
    type: text
    title_text: "<span class='fa fa-globe'> Executive Section </span>"
    subtitle_text: "<p> High Level Statistics</p>"
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Total Payment
    name: Total Payment
    model: demo_video
    explore: payment
    type: single_value
    fields: [payment.sum_payment]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 10000, background_color: "#7CB342",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 24
    height: 2
  - title: "# Of Rental"
    name: "# Of Rental"
    model: demo_video
    explore: rental
    type: single_value
    fields: [rental.count]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 10000, background_color: "#7CB342",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 10
    col: 9
    width: 8
    height: 2
  - title: "% of Inventory Are Rental"
    name: "% of Inventory Are Rental"
    model: demo_video
    explore: rental
    type: single_value
    fields: [rental_percentage.avg_rental_pert]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 30, background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 10
    col: 0
    width: 9
    height: 2
  - title: "# of Late Rental"
    name: "# of Late Rental"
    model: demo_video
    explore: rental
    type: single_value
    fields: [rental.num_late_rental]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 100, background_color: "#7CB342",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 10
    col: 17
    width: 7
    height: 2
  - title: Late Rental
    name: Late Rental
    model: demo_video
    explore: rental
    type: looker_line
    fields: [rental.rental_date, rental.ratio_late]
    fill_fields: [rental.rental_date]
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
    series_types: {}
    defaults_version: 1
    row: 37
    col: 0
    width: 24
    height: 8
  filters:
  - name: Rental Date Date
    title: Rental Date Date
    type: field_filter
    default_value: 20 year
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: inline
      options: []
    model: demo_video
    explore: rental_interval
    listens_to_filters: []
    field: rental_interval.rental_date_date
