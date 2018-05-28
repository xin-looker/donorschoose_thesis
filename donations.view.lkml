view: donations {
  sql_table_name: donorschoose.donations ;;

  dimension: donation_id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.Donation_ID ;;
  }

  measure: donation_amount {
    type: sum
    sql: ${TABLE}.Donation_Amount ;;
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
    drill_fields: [donation_id, projects.project_id, donors.donor_id]
  }
}
