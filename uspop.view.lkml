view: uspop {
  sql_table_name: donorschoose.uspop ;;

  dimension: id {
#     primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: pop {
    type: average
    sql: ${TABLE}.pop ;;
    value_format_name: decimal_0
  }

  dimension: state {
    primary_key: yes
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count_distinct
    drill_fields: [state]
  }
}
