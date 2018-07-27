view: teachers_retention_fact {
  derived_table: {
    sql: SELECT
        projects.Teacher_ID  AS teachers_teacher_id,
        CAST(CAST(teachers.Teacher_First_Project_Posted_Date  AS TIMESTAMP) AS DATE) AS teachers_teacher_first_project_posted_date,
        CAST(CAST(projects.Project_Posted_Date  AS TIMESTAMP) AS DATE) AS projects_project_posted_date,
        COUNT(DISTINCT projects.Project_ID ) AS projects_count,
        COALESCE(SUM(donations.Donation_Amount ), 0) AS donations_donation_amount,
        row_number() over() AS key
      FROM donorschoose.projects AS projects
      LEFT JOIN donorschoose.teachers  AS teachers ON projects.Teacher_ID = teachers.Teacher_ID
      LEFT JOIN donorschoose.donations  AS donations ON projects.Project_ID = donations.Project_ID

      GROUP BY 1,2,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: teachers_teacher_id {
    type: string
    sql: ${TABLE}.teachers_teacher_id ;;
  }

  dimension_group: teachers_teacher_first_project_posted_date {
    type: time
    sql: ${TABLE}.teachers_teacher_first_project_posted_date ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
  }

  dimension_group: projects_project_posted_date {
    type: time
    sql: ${TABLE}.projects_project_posted_date ;;
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
  }

  dimension: projects_count {
    type: number
    sql: ${TABLE}.projects_count ;;
  }

  dimension: donations_donation_amount {
    type: number
    sql: ${TABLE}.donations_donation_amount ;;
  }

  dimension: years_since_first_post {
    type: number
    sql: date_diff(${TABLE}.projects_project_posted_date, ${TABLE}.teachers_teacher_first_project_posted_date, YEAR) ;;
  }

  dimension: key {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.key ;;
  }

  measure: total_active_teachers {
    type: count_distinct
    sql: ${teachers_teacher_id} ;;
    filters: {
      field: projects_count
      value: ">=1"
    }
    drill_fields: [detail*]
  }

  measure: total_very_active_teachers {
    type: count_distinct
    sql: ${teachers_teacher_id} ;;
    filters: {
      field: projects_count
      value: "2"
    }
  }

  measure: total_super_active_teachers {
    type: count_distinct
    sql: ${teachers_teacher_id} ;;
    filters: {
      field: projects_count
      value: ">2"
    }
  }

  measure: total_teachers {
    type: count_distinct
    sql: ${teachers_teacher_id} ;;
  }

  measure: cohort_teacher_retention_percentage {
    type: number
    value_format_name: percent_1
    sql: 1.0*${total_active_teachers}/nullif(${total_teachers},0) ;;
  }

  set: detail {
    fields: [teachers_teacher_id, donations_donation_amount]
  }
}
