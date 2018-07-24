view: teachers_projects_fact {
  derived_table: {
    datagroup_trigger: teacher_project_date_datagroup
    sql: select teachers.teacher_id as teacher_id,
      max(projects.project_posted_date) as last_project_posted_date,
      count(distinct projects.project_id) as total_projects,
      sum(donations.donation_amount) as total_raised_donation
      from teachers
      left join projects on projects.teacher_id = teachers.teacher_id
      left join donations on donations.project_id = projects.project_id
      group by 1;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: teacher_id {
    type: string
    sql: ${TABLE}.teacher_id ;;
  }

  dimension_group: last_project_posted_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}.last_project_posted_date ;;
  }

  dimension: days_since_last_post{
    type: number
    sql: DATE_DIFF("2018-05-02", ${last_project_posted_date_date}, day) ;;
  }

  dimension: total_projects {
    type: number
    sql: ${TABLE}.total_projects ;;
  }

  dimension: total_raised_donation {
    type: number
    sql: ${TABLE}.total_raised_donation ;;
  }

  measure: average_raised_donation {
    type: average
    sql: ${total_raised_donation} ;;
  }

  set: detail {
    fields: [teacher_id, last_project_posted_date_date, total_projects, total_raised_donation]
  }
}
