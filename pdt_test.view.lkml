view: pdt_test {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'donations.donation_included_optional_donation'


      SELECT
        CASE WHEN donations.Donation_Included_Optional_Donation  THEN 'Yes' ELSE 'No' END
       AS donations_donation_included_optional_donation,
        COUNT(*) AS donations_count
      FROM donorschoose.donations  AS donations

      GROUP BY 1
      ORDER BY 2 DESC
       ;;
    datagroup_trigger: donation_date_datagroup
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: donations_donation_included_optional_donation {
    type: string
    sql: ${TABLE}.donations_donation_included_optional_donation ;;
  }

  dimension: donations_count {
    type: number
    sql: ${TABLE}.donations_count ;;
  }

  set: detail {
    fields: [donations_donation_included_optional_donation, donations_count]
  }
}
