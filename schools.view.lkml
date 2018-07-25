view: schools {
  sql_table_name: donorschoose.schools ;;

  dimension: school_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.School_ID ;;
  }

  dimension: school_city {
    type: string
    sql: ${TABLE}.School_City ;;
  }

  dimension: school_county {
    map_layer_name: us_counties_fips
    sql: ${TABLE}.School_County ;;
  }

  dimension: school_district {
    type: string
    sql: ${TABLE}.School_District ;;
  }

  dimension: school_metro_type {
    type: string
    sql: ${TABLE}.School_Metro_Type ;;
  }

  dimension: school_name {
    type: string
    sql: ${TABLE}.School_Name ;;
  }

  measure: school_percentage_free_lunch {
    type: average
    sql: ${TABLE}.School_Percentage_Free_Lunch ;;
  }

  dimension: school_state {
    map_layer_name: us_states
    sql: ${TABLE}.School_State ;;
  }

  dimension: school_zip {
    type: number
    sql: ${TABLE}.School_Zip ;;
  }

  measure: count {
    type: count
    drill_fields: [school_id, school_name, projects.count]
  }
}
