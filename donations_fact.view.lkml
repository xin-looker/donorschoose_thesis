view: donations_fact {
  derived_table: {
    datagroup_trigger: donation_date_datagroup
    sql: select donor_id,
    max(donation_received_date) as latest_donation,
    min(donation_received_date) as first_donation,
    sum(donation_amount) as lifetime_donation,
    count(distinct donation_id) as total_num_donations,
    count(distinct projects.project_id) as total_projects_donated,
    --wrong defination
    if(count(distinct donation_id) = count(distinct projects.project_id), true, false) as eq
    from donations
    left join projects on donations.project_id = projects.project_id
    group by 1;;
  }
  dimension: donor_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.donor_id ;;
  }
  dimension_group: last_donation {
    type: time
    sql: ${TABLE}.latest_donation ;;
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

  dimension_group: first_donation {
    type: time
    sql: ${TABLE}.first_donation ;;
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
# check
  dimension: days_since_last_donation {
    type: number
    sql:DATE_DIFF("2018-05-02", ${last_donation_date}, day);;
  }

  dimension:lifetime_donation{
    type: number
    sql: ${TABLE}.lifetime_donation ;;
    value_format: "$#,##0.0"
  }

  measure: average_lifetime_donation {
    type: average
    sql: ${TABLE}.lifetime_donation;;
    value_format: "$#,##0.0"
  }

  measure: total_donors {
    type: count_distinct
    sql: ${donor_id} ;;
  }

  measure: average_days_since_last_donation {
    type: average
    sql: ${days_since_last_donation} ;;
    value_format: "0.0"
  }

  dimension: total_projects_donated {
    type: number
    sql: ${TABLE}.total_projects_donated ;;
  }

  dimension: total_num_donations {
    type: number
    sql: ${TABLE}.total_num_donations ;;
  }

  dimension: multiple_donation_to_one_project_yesno {
    type: yesno
    sql: ${TABLE}.eq ;;
  }

  measure: average_num_donations {
    type: average
    sql: ${total_num_donations} ;;
    value_format: "0.0"
  }

  measure: average_num_projects_donated {
    type: average
    sql: ${total_projects_donated} ;;
  }
}
