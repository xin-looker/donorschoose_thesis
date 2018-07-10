view: projects_title_a {
  derived_table: {
    sql: select * from donorschoose.projects where project_title like 'A%' ;;
  }

  # derived_table: {
  #   sql: select * from donorschoose.projects
  #   where {% condition project_title %} projects.project_title {% endcondition %};;
  # }

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
