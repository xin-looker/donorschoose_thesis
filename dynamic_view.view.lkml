view: dynamic_view {

  sql_table_name:
    {% if schema_picker._value == 'A' %}
      ${projects_title_a.SQL_TABLE_NAME}
    {% elsif schema_picker._value == 'B' %}
      ${projects_title_b.SQL_TABLE_NAME}
    {% else %}
      ${projects_title_c.SQL_TABLE_NAME}
    {% endif %};;


  filter: schema_picker {
    suggestions: ["A", "B"]
  }

  dimension: my_value {
    type: string
    hidden: yes
    sql: {% parameter schema_picker %}
      ;;
      }

    dimension: project_id {
      primary_key: yes
      type: string
      sql: ${TABLE}.Project_ID ;;
    }

    measure: project_cost {
      type: sum
      sql: ${TABLE}.Project_Cost ;;
      value_format: ".00"
    }

    dimension: project_title {
      type: string
      sql: ${TABLE}.Project_Title ;;
    }


    dimension: test {
      type: string
      sql:  case when RAND() < 0.5 THEN "A"
            else "B"
            end;;
    }

  }
