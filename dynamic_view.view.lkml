view: dynamic_view {

  # sql_table_name:
  #   {% if schema_picker._value == 'A' %}
  #     ${projects_title_a.SQL_TABLE_NAME}
  #   {% elsif schema_picker._value == 'B' %}
  #     ${projects_title_b.SQL_TABLE_NAME}
  #   {% else %}
  #     ${projects_title_c.SQL_TABLE_NAME}
  #   {% endif %};;

  sql_table_name:
  {% if tablename._parameter_value == 'projects_title_a' %}
  ${projects_title_a.SQL_TABLE_NAME}
  {% elsif tablename._parameter_value == 'projects_title_b' %}
  ${projects_title_b.SQL_TABLE_NAME}
  {% else %}
  ${projects_title_c.SQL_TABLE_NAME}
  {% endif %};;

  # sql_table_name:
  # {% assign var= _filters['schema_picker'] %}
  # {% if value == 'A' %}
  # ${projects_title_a.SQL_TABLE_NAME}
  # {% elsif value == 'B' %}
  # ${projects_title_b.SQL_TABLE_NAME}
  # {% else %}
  # ${projects_title_c.SQL_TABLE_NAME}
  # {% endif %};;

  parameter: tablename {
    type: unquoted
    allowed_value: {
      label: "filter a"
      value: "projects_title_a"
    }

    allowed_value: {
      label: "filter b"
      value: "projects_title_b"
    }

    allowed_value: {
      label: "filter c"
      value: "projects_title_c"
    }
  }


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
