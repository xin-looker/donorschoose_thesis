view: donations {
  sql_table_name: donorschoose.donations ;;

  dimension: donation_id {
    primary_key: yes
    type: string
#     hidden: yes
    sql: ${TABLE}.Donation_ID ;;
  }

  measure: donation_amount {
    type: sum
    sql: ${TABLE}.Donation_Amount;;
    # value_format: "$#.##0"
    value_format_name: decimal_1
    drill_fields: [detail*]
    html: <font color="darkgreen">{{rendered_value}}</font> <font color="red">WTE</font>;;
  }

  measure: donation_amount_M {
    type: sum
    sql: ${TABLE}.Donation_Amount ;;
    value_format: "$0.000,,\" M\""
    drill_fields: [detail*]
  }

  measure: donation_amount_K {
    type: sum
    sql: ${TABLE}.Donation_Amount ;;
    value_format: "$0.0,\" K\""
    drill_fields: [detail*]
  }

  dimension: donation_included_optional_donation {
    type: yesno
    sql: ${TABLE}.Donation_Included_Optional_Donation ;;
  }

  dimension: donor_cart_sequence {
    type: number
    hidden: yes
    sql: ${TABLE}.Donor_Cart_Sequence ;;
  }

  dimension: donor_id {
    type: string
    hidden: yes
    sql: ${TABLE}.Donor_ID ;;
  }

  dimension: project_id {
    type: string
    hidden: yes
    sql: ${TABLE}.Project_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: donation_received_date {
    type: time
    timeframes: [
      raw,
      minute,
      hour,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: datetime
    sql: ${TABLE}.Donation_Received_Date ;;
  }

  set: detail{
    fields: [
      donor_id,
      donors.state,
      donations.donation_amount,
      donations.count
    ]
  }
}
