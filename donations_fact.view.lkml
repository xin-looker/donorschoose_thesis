view: donations_fact {
  derived_table: {
    datagroup_trigger: donation_date_datagroup
    sql: select donor_id, extract(date from max(donation_received_date)) as latest_donation from donations group by donor_id;;

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

  dimension: days_since_last_donation {
    type: number
    sql:DATE_DIFF(CURRENT_DATE, ${last_donation_date}, day);;

  }
}
