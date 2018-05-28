view: teachers {
  sql_table_name: donorschoose.teachers ;;

  dimension: teacher_id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.Teacher_ID ;;
  }

  dimension_group: teacher_first_project_posted {
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
    sql: ${TABLE}.Teacher_First_Project_Posted_Date ;;
  }

  dimension: teacher_prefix {
    type: string
    sql: ${TABLE}.Teacher_Prefix ;;
  }

  measure: count {
    type: count
    drill_fields: [teacher_id, projects.count]
  }
}
