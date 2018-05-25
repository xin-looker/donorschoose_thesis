connection: "xin"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: xin_donorschoose_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: xin_donorschoose_default_datagroup

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
}

explore: donors {}

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
