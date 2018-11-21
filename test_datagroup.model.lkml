connection: "xin"

# include all the views
include: "donations.view"
include: "pdt_test.view"

# include all the dashboards
include: "*.dashboard"

datagroup: donation_date_datagroup {
  sql_trigger: SELECT MAX(donations_received_date) FROM donations;;
  max_cache_age: "24 hour"
}

datagroup: teacher_project_date_datagroup {
  sql_trigger: SELECT count(teacher_id) FROM teachers;;
  max_cache_age: "24 hour"
}

persist_with: donation_date_datagroup
