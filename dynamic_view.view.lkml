view: dynamic_view {

  sql_table_name:

  {% if _filters == 'a' %}
  ${projects_title_a.SQL_TABLE_NAME}
  {% elsif _filters == 'b' %}
  ${projects_title_b.SQL_TABLE_NAME}
  {% else %}
  ${projects_title_c.SQL_TABLE_NAME}
  {% endif %};;

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

  }
