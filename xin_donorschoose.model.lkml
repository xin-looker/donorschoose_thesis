connection: "xin"

# include all the views
include: "donations.view"
include: "pdt_test.view"

# include all the dashboards
 include: "*.dashboard"

datagroup: donation_date_datagroup {
  sql_trigger: SELECT MAX(Donations_Received_Date) FROM donations;;
  max_cache_age: "24 hour"
}

datagroup: teacher_project_date_datagroup {
  sql_trigger: SELECT count(teacher_id) FROM teachers;;
  max_cache_age: "24 hour"
}

persist_with: donation_date_datagroup

explore: pdt_test {}

explore: donations {}
#   join: projects {
#     type: left_outer
#     sql_on: ${donations.project_id} = ${projects.project_id} ;;
#     relationship: many_to_one
#   }
#
#   join: donors {
#     type: left_outer
#     sql_on: ${donations.donor_id} = ${donors.donor_id} ;;
#     relationship: many_to_one
#   }
#
#   join: schools {
#     type: left_outer
#     sql_on: ${projects.school_id} = ${schools.school_id} ;;
#     relationship: many_to_one
#   }
#
#   join: teachers {
#     type: left_outer
#     sql_on: ${projects.teacher_id} = ${teachers.teacher_id} ;;
#     relationship: many_to_one
#   }
#   join: donations_fact {
#     type: left_outer
#     sql_on: ${donations.donor_id} = ${donations_fact.donor_id} ;;
#     relationship: many_to_one
#   }
#
#   join: donations_projects_fact {
#     type: left_outer
#     sql_on: ${donations.project_id}= ${donations_projects_fact.project_id} ;;
#     relationship: many_to_one
#   }
#
#   join: us_population {
#     type: left_outer
#     sql_on: ${schools.school_state}=${us_population.state};;
#     relationship: many_to_one
#   }
# }
#
# explore: donors {
#   join: donations_fact {
#     type: left_outer
#     sql_on: ${donors.donor_id}=${donations_fact.donor_id} ;;
#     relationship: one_to_one
#   }
#
#   join: us_population {
#     type: left_outer
#     sql_on: ${donors.donor_state}=${us_population.state} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: donations_fact {
# }
#
# explore: projects {
#
#   join: schools {
#     type: left_outer
#     sql_on: ${projects.school_id} = ${schools.school_id} ;;
#     relationship: many_to_one
#   }
#
#   join: teachers {
#     type: left_outer
#     sql_on: ${projects.teacher_id} = ${teachers.teacher_id} ;;
#     relationship: many_to_one
#   }
#
#   join: teachers_projects_fact {
#     type: left_outer
#     sql_on: ${projects.teacher_id}= ${teachers_projects_fact.teacher_id};;
#     relationship: many_to_one
#   }
#
#   join: donations_projects_fact {
#     type: left_outer
#     sql_on: ${projects.project_id} = ${donations_projects_fact.project_id} ;;
#     relationship: one_to_one
#   }
#
#   join: donations {
#     type: left_outer
#     sql_on: ${projects.project_id} = ${donations.project_id} ;;
#     relationship: one_to_many
#   }
#
#   join: us_population {
#     type: left_outer
#     sql_on: ${schools.school_state}=${us_population.state} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: resources {
#   join: projects {
#     type: left_outer
#     sql_on: ${resources.project_id} = ${projects.project_id} ;;
#     relationship: many_to_one
#   }
#
#   join: schools {
#     type: left_outer
#     sql_on: ${projects.school_id} = ${schools.school_id} ;;
#     relationship: many_to_one
#   }
#
#   join: teachers {
#     type: left_outer
#     sql_on: ${projects.teacher_id} = ${teachers.teacher_id} ;;
#     relationship: many_to_one
#   }
#
#   join: us_population {
#     type: left_outer
#     sql_on: ${schools.school_state}=${us_population.state} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: teachers_retention_fact {
#   join: teachers {
#     type: left_outer
#     sql_on: ${teachers_retention_fact.teachers_teacher_id} = ${teachers.teacher_id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: schools {
#   join: us_population {
#     type: left_outer
#     sql_on: ${schools.school_state}=${us_population.state} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: teachers {}
#
# explore: teachers_projects_fact {}
#
# explore: uspop {
#   hidden: yes
# }
#
# explore: us_population {}
