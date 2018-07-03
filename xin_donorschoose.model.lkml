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

# explore: dynamic_view {
#   sql_table_name:
#   {% if projects.project_title like 'a%' %}
#   project_title_a
#   {% elsif projects.project_title like 'b%' %}
#   project_title_b
#   {% else %}
#   project_title_c
#   {% endif %};;
# }

explore: dynamic_view {

  always_filter: {
    filters: {
      field: project_title
      value: "b%"
    }
  }

  join: projects_title_a {
    type: left_outer
    sql_on: ${projects_title_a.project_id} = ${dynamic_view.project_id} ;;
    relationship: one_to_one
  }

  join: projects_title_b {
    type: left_outer
    sql_on: ${projects_title_b.project_id} = ${dynamic_view.project_id} ;;
    relationship: one_to_one
  }

  join: projects_title_c {
    type: left_outer
    sql_on: ${projects_title_c.project_id} = ${dynamic_view.project_id} ;;
    relationship: one_to_one
  }
}

explore: projects_title_a {}
explore: projects_title_b {}
explore: projects_title_c {}

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

explore: donations_fact {
}

explore: projects {

  always_filter: {
    filters: {
      field: project_title
      value: "B%"
    }

#     filters: {
#       field: project_title
#       value: "C%"
#     }
#
#     filters: {
#       field: project_title
#       value: "D%"
#     }
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
