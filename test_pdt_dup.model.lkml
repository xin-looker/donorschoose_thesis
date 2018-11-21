connection: "xin"

# include all the views
include: "donations.view"
include: "pdt_test.view"

# include all the dashboards
include: "*.dashboard"
include: "test_datagroup.model.lkml"

# datagroup: donation_date_datagroup {
#   sql_trigger: SELECT MAX(donations_received_date) FROM donations;;
#   max_cache_age: "24 hour"
# }
#
# datagroup: teacher_project_date_datagroup {
#   sql_trigger: SELECT count(teacher_id) FROM teachers;;
#   max_cache_age: "24 hour"
# }

persist_with: donation_date_datagroup

explore: donations {
#   join: projects {
#     type: left_outer
#     sql_on: ${donations.project_id} = ${projects.project_id} ;;
#     relationship: many_to_one
#   }

  join: pdt_test {
    type: left_outer
    sql_on: cast(${donations.donation_included_optional_donation} as string)=${pdt_test.donations_donation_included_optional_donation} ;;
    relationship: many_to_one
  }
}
