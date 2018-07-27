view: donors {
  sql_table_name: donorschoose.donors ;;

  dimension: donor_id {
    primary_key: yes
    type: string
    hidden: no
    drill_fields: [detail*]
    sql: ${TABLE}.donor_id ;;
  }

  dimension: donor_city {
    type: string
    sql: ${TABLE}.donor_city ;;
  }

  dimension: donor_is_teacher {
    type: yesno
    sql: ${TABLE}.donor_is_teacher ;;
  }

  dimension: donor_state {
    type: string
    sql: ${TABLE}.donor_state ;;
  }

  dimension: donor_zip {
    type: string
    sql: ${TABLE}.donor_zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail{
    fields: [
      projects.project_id,
      projects.project_type, projects.project_resource_category,
      donor_id,
      donor_is_teacher,
      schools.school_state,
      donations.donation_amount,
      donations.count
    ]
  }
}
