view: projects {
  sql_table_name: donorschoose.projects;;

  # parameter: project_cost_band{
  #   type: unquoted
  #   allowed_value: {
  #     label: "less than 500"
  #     value: "<500"
  #   }

  #   allowed_value: {
  #     label: "500 to 2000"
  #     value: ">=500 and <2000"
  #   }

  #   allowed_value: {
  #     label: "2000 to 5000"
  #     value: ">=2000 and <5000"
  #   }

  #   allowed_value: {
  #     label: "5000 above"
  #     value: ">5000"
  #   }

  #   allowed_value: {
  #     label: "All results"
  #     value: ">0"
  #   }
  # }

  dimension: project_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Project_ID ;;
  }

  measure: project_cost {
    type: sum
    sql: ${TABLE}.Project_Cost ;;
    value_format: ".00"
    drill_fields: [detail*]
  }

  dimension: project_cost_tiers {
    type: tier
    tiers: [0, 100, 300, 500, 1000, 2000, 3500, 5000, 10000, 20000, 30000, 40000, 50000, 75000, 100000, 200000]
    style: integer
    sql: ${TABLE}.Project_Cost;;
    value_format: "$#,##0"
  }

  # dimension: project_cost_by_band {
  #   type: string
  #   sql: CASE WHEN ${TABLE}.project_cost > 100000 THEN "a lot of money" WHEN ${TABLE}.project_cost <100000 and ${TABLE}.project_cost > 2000 THEN "fair amount" else "easy to achive" end;;
  #   link: {
  #     label: "Google"
  #     url: "http://www.google.com/search?q={{ value }}"
  #     icon_url: "http://google.com/favicon.ico"
  #   }
#     html: {% if value == "a lot of money"}
#       <font color="darkgreen">{{ rendered_value }}</font>
#     {% elsif value == "fair amount"}
#       <font color="goldenrod">{{ rendered_value }}</font>
#     {% else %}
#       <font color="darkred">{{ rendered_value }}</font>
#     {% endif %} ;;

  # }

  # measure: count_formatted {
  #   type: count
  #   drill_fields: [detail*]
  #   # html:
  #   # <a href="#drillmenu" target="_self">
  #   # {% if value > 1000 %}
  #   # <font color="darkgreen" size=30px>{{ rendered_value }}</font>
  #   # {% elsif value > 100 %}
  #   # <font color="goldenrod">{{ rendered_value }}</font>
  #   # {% else %}
  #   # <font color="darkred">{{ rendered_value }}</font>
  #   # {% endif %}
  #   # </a>;;
  #   html:
  #   <a href="#drillmenu" target="_self">
  #   {% if value > 1000 %}
  #   <div style:"color="darkgreen"" size=30px>{{ rendered_value }}</div>
  #   {% elsif value > 100 %}
  #   <font color="goldenrod">{{ rendered_value }}</font>
  #   {% else %}
  #   <font color="darkred">{{ rendered_value }}</font>
  #   {% endif %}
  #   </a>;;
  # }

  dimension: project_current_status {
    type: string
    sql: ${TABLE}.Project_Current_Status ;;
  }

  dimension: project_essay {
    type: string
    sql: ${TABLE}.Project_Essay ;;
  }

  dimension_group: project_fully_funded {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Project_Fully_Funded_Date ;;
  }

  dimension: project_grade_level_category {
    type: string
    sql: ${TABLE}.Project_Grade_Level_Category ;;
  }

  dimension_group: project_posted {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Project_Posted_Date ;;
  }

  dimension: distinct_project_posted_month {
    type: date
    sql: distinct(${project_posted_month}) ;;
  }

  dimension: project_resource_category {
    type: string
    sql: ${TABLE}.Project_Resource_Category ;;
  }

  dimension: project_subject_category_tree {
    type: string
    sql: ${TABLE}.Project_Subject_Category_Tree ;;
  }

  dimension: project_subject_subcategory_tree {
    type: string
    sql: ${TABLE}.Project_Subject_Subcategory_Tree ;;
  }

  dimension: project_title {
    type: string
    sql: ${TABLE}.Project_Title ;;
  }

  dimension: project_type {
    type: string
    sql: ${TABLE}.Project_Type ;;
  }

  dimension: school_id {
    type: string
    sql: ${TABLE}.School_ID ;;
  }

  dimension: teacher_id {
    type: string
    sql: ${TABLE}.Teacher_ID ;;
  }

  dimension: teacher_project_posted_sequence {
    type: number
    sql: ${TABLE}.Teacher_Project_Posted_Sequence ;;
  }

  dimension: fully_funded_days_tiers {
    type: tier
    tiers: [0, 10, 20, 30, 45, 60, 75, 90, 105, 120, 150, 180, 210, 240]
    style: integer
    sql: ${dimen_days_project_fully_funded} ;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: last_posted_project_date{
    type: date
    sql: max(${project_posted_raw}) ;;
    convert_tz: no
    drill_fields: [detail*]
  }

  measure: first_posted_project{
    type: string
    sql: min(${project_posted_raw}) ;;
    drill_fields: [detail*]
  }

  measure: last_project_days {
    type: number
    sql: DATE_DIFF("2018-05-09", ${last_posted_project_date}, day);;
    drill_fields: [detail*]
  }

  filter: project_status_parameter {
    type: string
    suggest_dimension: project_current_status
  }

  measure: project_status_count {
    type: count_distinct
    sql: case when ${project_current_status} = {% parameter project_status_parameter %}
          then ${project_id}
          end;;
    label: "Fully Funded Project Count"
  }

  measure: projects_status_percentage {
    type: number
    sql: ${project_status_count}/${count} ;;
    value_format_name: percent_1
    drill_fields: [detail*]
    label: "Fully Funded Project Percentage"
  }

  measure: days_project_fully_funded {
    type: average
    sql: date_diff(${project_fully_funded_date}, ${project_posted_date}, day) ;;
    value_format_name: decimal_1
    drill_fields: [detail*]
  }

  dimension: dimen_days_project_fully_funded {
    type: number
    sql: date_diff(${project_fully_funded_date}, ${project_posted_date}, day) ;;
    value_format_name: decimal_1
  }


#   measure: average_project_age {
#     type: average
#     sql:${last_project_age};;
#   }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      project_id,
      project_title,
      project_posted_date,
      project_fully_funded_date,
      project_resource_category,
      project_subject_category_tree,
      project_current_status,
      donations.count,
      resources.count,
      project_cost,
      donations.donations_amount,
      school_id
    ]
  }
}
