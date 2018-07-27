view: us_population {
    derived_table: {
      sql: SELECT
        uspop.state  AS uspop_state,
        AVG(uspop.pop ) AS uspop_pop
      FROM donorschoose.uspop  AS uspop

      WHERE
        (uspop.year LIKE '%2017%' OR uspop.year LIKE '%2016%' OR uspop.year LIKE '%2015%')
      GROUP BY 1
       ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: state {
      type: string
      primary_key: yes
      sql: ${TABLE}.uspop_state ;;
    }

    dimension: pop {
      type: number
      sql: ${TABLE}.uspop_pop ;;
      value_format_name: decimal_0
    }

    set: detail {
      fields: [state, pop]
    }
  }
