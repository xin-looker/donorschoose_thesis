view: projects {
  sql_table_name: donorschoose.projects;;

#   parameter: project_cost_band{
#     type: unquoted
#     allowed_value: {
#       label: "less than 500"
#       value: "${project_essay}"
#     }
#
#     allowed_value: {
#       label: "500 to 2000"
#       value: "project_current_status"
#     }
#
#     allowed_value: {
#       label: "2000 to 5000"
#       value: "project_essay"
#     }
#
#     allowed_value: {
#       label: "5000 above"
#       value: ">5000"
#     }
#
#     allowed_value: {
#       label: "All results"
#       value: ">0"
#     }
#   }

  dimension: project_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Project_ID ;;
  }

  measure: project_cost {
    type: sum
    sql: ${TABLE}.Project_Cost ;;
    value_format: ".00"
  }

  dimension: project_cost_tiers {
    type: tier
    tiers: [0, 3, 100, 300, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000]
    style: interval
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: last_posted_project{
    type: string
    sql: max(${project_posted_raw}) ;;
  }

  dimension: project_age {
    type: number
    sql: DATE_DIFF("2018-05-09", ${project_posted_date}, day);;
  }

  measure: average_project_age {
    type: average
    sql:${project_age};;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      project_id,
      project_title,
      donations.count,
      resources.count,
      project_cost,
      donations.donations_amount
    ]
  }
}
