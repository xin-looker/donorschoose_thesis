view: teachers {
  sql_table_name: donorschoose.teachers ;;

  dimension: teacher_id {
    primary_key: yes
    type: string
#     hidden: yes
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

  # Needs to be reviewed, the matrix should be based on the average resolution days
  dimension: new_teacher{
    type: yesno
    sql: DATE_DIFF('2018-05-09',${teacher_first_project_posted_date}, day) < 90;;
  }


}
