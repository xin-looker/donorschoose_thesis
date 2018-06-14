connection: "xin"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: donation_date_datagroup {
  sql_trigger: SELECT MAX(donations_received_date) FROM donations;;
  max_cache_age: "24 hour"
}

persist_with: donation_date_datagroup

explore: donations {
  join: projects {
    type: left_outer
    sql_on: ${donations.project_id} = ${projects.project_id} ;;
    relationship: many_to_one
  }

  join: donors {
    type: left_outer
    sql_on: ${donations.donor_id} = ${donors.donor_id} ;;
    relationship: many_to_one
  }

  join: schools {
    type: left_outer
    sql_on: ${projects.school_id} = ${schools.school_id} ;;
    relationship: many_to_one
  }

  join: teachers {
    type: left_outer
    sql_on: ${projects.teacher_id} = ${teachers.teacher_id} ;;
    relationship: many_to_one
  }
  join: donations_fact {
    type: left_outer
    sql_on: ${donations.donor_id} = ${donations_fact.donor_id} ;;
    relationship: many_to_one
  }
}

explore: donors {
  join: donations_fact {
    type: left_outer
    sql_on: ${donors.donor_id}=${donations_fact.donor_id} ;;
    relationship: one_to_one
  }
}

explore: donations_fact {}

explore: projects {
  join: schools {
    type: left_outer
    sql_on: ${projects.school_id} = ${schools.school_id} ;;
    relationship: many_to_one
  }

  join: teachers {
    type: left_outer
    sql_on: ${projects.teacher_id} = ${teachers.teacher_id} ;;
    relationship: many_to_one
  }
}

explore: resources {
  join: projects {
    type: left_outer
    sql_on: ${resources.project_id} = ${projects.project_id} ;;
    relationship: many_to_one
  }

  join: schools {
    type: left_outer
    sql_on: ${projects.school_id} = ${schools.school_id} ;;
    relationship: many_to_one
  }

  join: teachers {
    type: left_outer
    sql_on: ${projects.teacher_id} = ${teachers.teacher_id} ;;
    relationship: many_to_one
  }
}

explore: schools {}

explore: teachers {}
