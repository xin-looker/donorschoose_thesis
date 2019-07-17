- dashboard: xin_dashboard_x
  title: Donorschoose -  Xin's Thesis
  layout: newspaper
  load_configuration: wait
  query_timezone: query_saved
  elements:
  - name: Donation per state
    title: Donation per state
    model: xin_donorschoose
    explore: donations
    type: looker_geo_choropleth
    fields:
    - donations.donation_amount_M
    - schools.school_state
    filters:
      projects.project_posted_year: 3 years
    sorts:
    - donations.donation_amount_M desc
    limit: 500
    query_timezone: America/Los_Angeles
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    empty_color: "#ffffff"
    colors:
    - "#a9c574"
    row: 14
    col: 0
    width: 14
    height: 8
  - name: Do donors more likely to donate to schools from their state?
    title: Do donors more likely to donate to schools from their state?
    model: xin_donorschoose
    explore: donations
    type: single_value
    fields:
    - donations_projects_fact.same_state_donor_percentage
    filters:
      projects.project_posted_year: 3 years
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 8
    col: 16
    width: 8
    height: 6
  - name: Are donor teachers or not?
    title: Are donor teachers or not?
    model: xin_donorschoose
    explore: donors
    type: looker_pie
    fields:
    - donors.donor_is_teacher
    - donors.count
    fill_fields:
    - donors.donor_is_teacher
    sorts:
    - donors.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    row: 8
    col: 0
    width: 8
    height: 6
  - name: Donors' average days since last donation
    title: Donors' average days since last donation
    model: xin_donorschoose
    explore: donations
    type: single_value
    fields:
    - donations_fact.average_days_since_last_donation
    filters:
      projects.project_posted_year: 3 years
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Donors' Days Since Last Donation
    listen: {}
    note_state: expanded
    note_display: hover
    note_text: Donors tend to donate on annually basis
    row: 4
    col: 8
    width: 8
    height: 4
  - name: Donors' average life donation
    title: Donors' average life donation
    model: xin_donorschoose
    explore: donations
    type: single_value
    fields:
    - donations_fact.average_lifetime_donation
    filters:
      projects.project_posted_year: 3 years
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Donors' Average Lifetime Donation
    row: 4
    col: 0
    width: 8
    height: 4
  - name: Donors' Average Number of Donations
    title: Donors' Average Number of Donations
    model: xin_donorschoose
    explore: donations
    type: single_value
    fields:
    - donations_fact.average_num_donations
    filters:
      projects.project_posted_year: 3 years
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Donors' Average Number of Donations
    row: 4
    col: 16
    width: 8
    height: 4
  - name: Total projects counts vs fully funded project counts
    title: Total projects counts vs fully funded project counts
    model: xin_donorschoose
    explore: donations
    type: looker_column
    fields:
    - schools.school_state
    - projects.count
    - projects.projects_status_percentage
    filters:
      projects.project_status_parameter: Fully Funded
      projects.project_posted_year: 3 years
    sorts:
    - projects.count desc
    limit: 500
    column_limit: 50
    total: true
    stacking: ''
    colors:
    - 'palette: Looker Classic'
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types:
      projects.project_status_percentage: area
      projects.projects_status_percentage: area
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: projects.projects_status_percentage
        name: Projects Fully Funded Project Percentage
        axisId: projects.projects_status_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 41
    col: 0
    width: 24
    height: 9
  - name: Top 10 donors city
    title: Top 10 donors city
    model: xin_donorschoose
    explore: donors
    type: looker_bar
    fields:
    - donors.donor_city
    - donors.count
    filters:
      donors.donor_city: "-EMPTY"
    sorts:
    - donors.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    map_plot_mode: points
    heatmap_gridlines: false
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
    value_labels: legend
    label_type: labPer
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    row: 22
    col: 8
    width: 8
    height: 7
  - name: Top 10 donors states
    title: Top 10 donors states
    model: xin_donorschoose
    explore: donors
    type: looker_bar
    fields:
    - donors.donor_state
    - donors.count
    sorts:
    - donors.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    row: 22
    col: 0
    width: 8
    height: 7
  - name: Teachers's prefix on fund raising speed
    title: Teachers's prefix on fund raising speed
    model: xin_donorschoose
    explore: projects
    type: looker_column
    fields:
    - teachers.teacher_prefix
    - teachers.count
    - teachers_projects_fact.days_since_last_post
    - teachers_projects_fact.average_raised_donation
    filters:
      projects.project_posted_year: 3 years
    sorts:
    - teachers.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    value_labels: labels
    label_type: labPer
    font_size: '12'
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types:
      teachers_projects_fact.average_raised_donation: area
    colors:
    - 'palette: Looker Classic'
    series_colors:
      teachers_projects_fact.average_raised_donation: "#929292"
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: teachers_projects_fact.days_since_last_post
        name: Teachers Projects Fact Days Since Last Post
        axisId: teachers_projects_fact.days_since_last_post
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: teachers_projects_fact.average_raised_donation
        name: Teachers Projects Fact Average Raised Donation
        axisId: teachers_projects_fact.average_raised_donation
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    hidden_fields:
    - teachers.count
    row: 108
    col: 0
    width: 12
    height: 7
  - name: Teacher vs non-teacher donor
    title: Teacher vs non-teacher donor
    model: xin_donorschoose
    explore: donations
    type: table
    fields:
    - donors.donor_is_teacher
    - donations_fact.average_num_donations
    - donations_fact.average_lifetime_donation
    - donations_fact.average_days_since_last_donation
    fill_fields:
    - donors.donor_is_teacher
    filters:
      projects.project_posted_year: 5 years
    sorts:
    - donations_fact.average_num_donations desc
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    row: 8
    col: 8
    width: 8
    height: 6
  - name: Teachers's prefix
    title: Teachers's prefix
    model: xin_donorschoose
    explore: projects
    type: looker_pie
    fields:
    - teachers.teacher_prefix
    - teachers.count
    - teachers_projects_fact.days_since_last_post
    - teachers_projects_fact.average_raised_donation
    filters:
      projects.project_posted_year: 3 years
    sorts:
    - teachers.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: 12
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: projects.project_status_percentage
        name: Projects Project Status Percentage
        axisId: projects.project_status_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    hidden_fields:
    - teachers_projects_fact.days_since_last_post
    - teachers_projects_fact.average_raised_donation
    row: 100
    col: 15
    width: 9
    height: 8
  - name: teachers project post retention
    title: teachers project post retention
    model: xin_donorschoose
    explore: teachers_retention_fact
    type: looker_line
    fields:
    - teachers_retention_fact.years_since_first_post
    - teachers_retention_fact.total_active_teachers
    - teachers_retention_fact.teachers_teacher_first_project_posted_date_year
    pivots:
    - teachers_retention_fact.teachers_teacher_first_project_posted_date_year
    fill_fields:
    - teachers_retention_fact.teachers_teacher_first_project_posted_date_year
    filters:
      teachers_retention_fact.teachers_teacher_first_project_posted_date_year: 2013/01/01
        to 2018/01/01
    sorts:
    - teachers_retention_fact.total_active_teachers desc 0
    - teachers_retention_fact.teachers_teacher_first_project_posted_date_year
    limit: 500
    dynamic_fields:
    - table_calculation: retention_rate
      label: retention rate
      expression: "${teachers_retention_fact.total_active_teachers}/offset(${teachers_retention_fact.total_active_teachers},\
        \ -1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_series: []
    hidden_fields:
    - retention_rate
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    row: 100
    col: 0
    width: 15
    height: 8
  - name: Teacher prefix fully funded comparsion
    title: Teacher prefix fully funded comparsion
    model: xin_donorschoose
    explore: projects
    type: looker_column
    fields:
    - teachers.teacher_prefix
    - projects.count
    - projects.projects_status_percentage
    filters:
      projects.project_posted_year: 3 years
      projects.project_status_parameter: Fully Funded
    sorts:
    - projects.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    font_size: '12'
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types:
      projects.project_status_percentage: area
      projects.projects_status_percentage: area
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: projects.projects_status_percentage
        name: Projects Fully Funded Project Percentage
        axisId: projects.projects_status_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    hidden_fields: []
    row: 108
    col: 12
    width: 12
    height: 7
  - name: School Metro fully funded comparsion
    title: School Metro fully funded comparsion
    model: xin_donorschoose
    explore: projects
    type: table
    fields:
    - schools.school_metro_type
    - projects.count
    - projects.project_posted_year
    - projects.projects_status_percentage
    pivots:
    - projects.project_posted_year
    filters:
      projects.project_status_parameter: Fully Funded
      projects.project_posted_year: 2014/01/01 to 2017/12/31
    sorts:
    - projects.count desc 0
    - projects.project_posted_year
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: average_fully_funded_project
      label: Average fully funded project
      expression: mean(pivot_row(${projects.projects_status_percentage}))
      value_format:
      value_format_name: percent_1
      _kind_hint: supermeasure
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    font_size: '12'
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: teachers_projects_fact.days_since_last_post
        name: Teachers Projects Fact Days Since Last Post
        axisId: teachers_projects_fact.days_since_last_post
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: teachers_projects_fact.average_raised_donation
        name: Teachers Projects Fact Average Raised Donation
        axisId: teachers_projects_fact.average_raised_donation
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    hidden_fields: []
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - average_fully_funded_project
      - projects.projects_status_percentage
    listen: {}
    row: 58
    col: 0
    width: 24
    height: 7
  - name: Projects & Donation Seasonality
    title: Projects & Donation Seasonality
    model: xin_donorschoose
    explore: projects
    type: looker_line
    fields:
    - projects.project_posted_month
    - projects.count
    - donations.count
    - donations.donation_amount_K
    fill_fields:
    - projects.project_posted_month
    sorts:
    - projects.project_posted_month desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    series_types: {}
    swap_axes: false
    hide_legend: false
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      - id: donations.count
        name: Donations Count
        axisId: donations.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: donations.donation_amount_K
        name: Donations Donation Amount K
        axisId: donations.donation_amount_K
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    trend_lines:
    - color: "#000000"
      label_position: center
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
      label: ''
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 2
      show_label: false
    row: 50
    col: 0
    width: 12
    height: 8
  - name: Projects posted in the last 3 years per state
    title: Projects posted in the last 3 years per state
    model: xin_donorschoose
    explore: donations
    type: looker_geo_choropleth
    fields:
    - projects.count
    - schools.school_state
    filters:
      projects.project_posted_year: 3 years
    sorts:
    - projects.count desc
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: true
    quantize_colors: false
    map_plot_mode: points
    heatmap_gridlines: false
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
    series_types: {}
    colors:
    - skyblue
    row: 33
    col: 0
    width: 14
    height: 8
  - name: Project type
    title: Project type
    model: xin_donorschoose
    explore: projects
    type: looker_column
    fields:
    - projects.count
    - projects.project_type
    - projects.projects_status_percentage
    filters:
      projects.project_posted_year: 3 years
      projects.project_status_parameter: Fully Funded
    sorts:
    - projects.count desc
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    font_size: '12'
    show_null_points: true
    interpolation: linear
    value_labels: labels
    label_type: labPer
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: projects.projects_status_percentage
        name: Projects Fully Funded Project Percentage
        axisId: projects.projects_status_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    show_dropoff: false
    row: 33
    col: 14
    width: 10
    height: 8
  - name: Project resource type project counts vs full funded percentage
    title: Project resource type project counts vs full funded percentage
    model: xin_donorschoose
    explore: projects
    type: looker_column
    fields:
    - projects.project_resource_category
    - projects.count
    - projects.projects_status_percentage
    filters:
      projects.project_posted_year: 3 years
      projects.project_status_parameter: Fully Funded
    sorts:
    - projects.count desc
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    stacking: ''
    colors:
    - "#62bad4"
    - "#a9c574"
    - "#929292"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    series_colors: {}
    series_types:
      projects.project_status_percentage: area
      projects.projects_status_percentage: area
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: projects.projects_status_percentage
        name: Projects Fully Funded Project Percentage
        axisId: projects.projects_status_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labPer
    show_null_points: true
    barColors:
    - red
    - blue
    groupBars: true
    labelSize: 10pt
    showLegend: true
    interpolation: linear
    row: 65
    col: 12
    width: 12
    height: 8
  - name: Project tiers
    title: Project tiers
    model: xin_donorschoose
    explore: projects
    type: looker_column
    fields:
    - projects.count
    - projects.project_cost_tiers
    - projects.projects_status_percentage
    filters:
      projects.project_posted_year: 3 years
      projects.project_status_parameter: Fully Funded
    sorts:
    - projects.project_cost_tiers
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    stacking: ''
    colors:
    - 'palette: Looker Classic'
    show_value_labels: false
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    series_colors: {}
    series_types:
      projects.project_status_percentage: area
      projects.projects_status_percentage: area
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: projects.projects_status_percentage
        name: Projects Fully Funded Project Percentage
        axisId: projects.projects_status_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    show_null_points: true
    interpolation: linear
    value_labels: labels
    label_type: labPer
    groupBars: true
    labelSize: 10pt
    showLegend: true
    row: 73
    col: 0
    width: 12
    height: 8
  - name: Project Grade Level in the past 3 years
    title: Project Grade Level in the past 3 years
    model: xin_donorschoose
    explore: projects
    type: looker_pie
    fields:
    - projects.project_grade_level_category
    - projects.count
    filters:
      projects.project_posted_year: 3 years
      projects.project_grade_level_category: "-unknown"
    sorts:
    - projects.count desc
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    barColors:
    - red
    - blue
    groupBars: true
    labelSize: 10pt
    showLegend: true
    interpolation: linear
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    row: 50
    col: 12
    width: 12
    height: 8
  - name: Project fully funded days
    title: Project fully funded days
    model: xin_donorschoose
    explore: projects
    type: looker_pie
    fields:
    - projects.fully_funded_days_tiers
    - projects.count
    filters:
      projects.project_posted_year: 3 years
      projects.project_current_status: Fully Funded
    sorts:
    - projects.fully_funded_days_tiers
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    stacking: ''
    show_value_labels: false
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    row: 73
    col: 12
    width: 12
    height: 8
  - name: "<b>Who are the Donors</b>"
    type: text
    title_text: "<b>Who are the Donors</b>"
    subtitle_text: ''
    body_text: |-
      + Donors tend to donate on annually basis
      + A typical donor donated 3 times of $180 in total
      + Majority of the donors are not teachers
      + They prefer donate to projects/schools in their own state
    row: 0
    col: 0
    width: 24
    height: 4
  - name: "<b>How Are The Projects Running</b>"
    type: text
    title_text: "<b>How Are The Projects Running</b>"
    body_text: |-
      + Most projects are posted in east and west coast
      + Projects postage reaches peak every August due to the new school term, January is second most posted time
      + Most projects are about Supplies, technologies and books
      + Most projects are for lower grades
    row: 29
    col: 0
    width: 24
    height: 4
  - name: "<b>Teachers</b>"
    type: text
    title_text: "<b>Teachers</b>"
    body_text: |-
      + Teachers are the main supplier of projects
      + They post projects on yearly basis
      + 30% of the teachers post again the next year after their 1st project
      +
    row: 96
    col: 0
    width: 24
    height: 4
  - name: XX1
    type: text
    body_text: |-
      + The majority of the donors are concentrated in east and west coast
      + Top states: CA, NY and TX
      + Donations per donor: Donors from Wyoming, Hawaii and Massachusetts donate more
    row: 14
    col: 14
    width: 10
    height: 8
  - name: Donation per donor each state 2013-2017
    title: Donation per donor each state 2013-2017
    model: xin_donorschoose
    explore: donations
    type: looker_line
    fields:
    - schools.school_state
    - donations.donation_amount_M
    - projects.project_posted_year
    - donors.count
    pivots:
    - schools.school_state
    fill_fields:
    - projects.project_posted_year
    filters:
      projects.project_posted_year: 2013/01/01 to 2018/01/01
    sorts:
    - projects.project_posted_year
    - donations.donation_amount_M desc 0
    - schools.school_state
    limit: 500
    column_limit: 500
    dynamic_fields:
    - table_calculation: donations_per_donor
      label: Donations Per Donor
      expression: "${donations.donation_amount_M}/${donors.count}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    colors:
    - "#62bad4"
    - "#a9c574"
    - "#929292"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    show_value_labels: false
    label_density: 25
    legend_position: center
    hide_legend: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trend_lines: []
    swap_axes: false
    show_null_points: true
    interpolation: linear
    map: usa
    map_projection: ''
    quantize_colors: false
    hidden_fields:
    - donations.donation_amount_M
    - donors.count
    row: 22
    col: 16
    width: 8
    height: 7
  - name: XX2
    type: text
    body_text: |-
      + Around 70% of the projects get fully funded in the past 3 years
      + This concentrated on the 100 - 1,000 cost band projects
      + Top categories in this cost band are for getting technologies, supplies and computers
      + 40% projects fully funded in 10 days, 99% projects tend to fully funded in 5 months
      + Schools based in urban area has higher fully funded percentage
    row: 65
    col: 0
    width: 12
    height: 8
  - name: category
    title: category
    model: xin_donorschoose
    explore: projects
    type: looker_donut_multiples
    fields:
    - projects.count
    - projects.project_cost_tiers
    - projects.projects_status_percentage
    - projects.project_resource_category
    pivots:
    - projects.project_resource_category
    filters:
      projects.project_posted_year: 3 years
      projects.project_status_parameter: Fully Funded
    sorts:
    - projects.project_cost_tiers
    - projects.project_resource_category
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Los_Angeles
    show_value_labels: false
    font_size: 12
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle_outline
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: projects.count
        name: Projects Count
        axisId: projects.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: projects.projects_status_percentage
        name: Projects Fully Funded Project Percentage
        axisId: projects.projects_status_percentage
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    show_null_points: true
    interpolation: linear
    value_labels: labels
    label_type: labPer
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hidden_fields:
    - projects.projects_status_percentage
    row: 81
    col: 0
    width: 24
    height: 15
