view: teachers_projects_fact {
  derived_table: {
    datagroup_trigger: teacher_project_date_datagroup
    sql: select teachers.teacher_id as teacher_id,
      max(projects.project_posted_date) as last_project_posted_date,
      count(distinct projects.project_id) as total_projects,
      sum(donations.donation_amount) as total_raised_donation
      from teachers
      join projects on projects.teacher_id = teachers.teacher_id
      join donations on donations.project_id = projects.project_id
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

  dimension: last_project_posted_date {
    type: date
    sql: ${TABLE}.last_project_posted_date ;;
  }

  dimension: total_projects {
    type: number
    sql: ${TABLE}.total_projects ;;
  }

  dimension: total_raised_donation {
    type: number
    sql: ${TABLE}.total_raised_donation ;;
  }

  set: detail {
    fields: [teacher_id, last_project_posted_date, total_projects, total_raised_donation]
  }
}
