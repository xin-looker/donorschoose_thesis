view: resources {
  sql_table_name: donorschoose.resources ;;

  dimension: project_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Project_ID ;;
  }

  dimension: resource_item_name {
    type: string
    sql: ${TABLE}.Resource_Item_Name ;;
  }

  dimension: resource_quantity {
    type: number
    sql: ${TABLE}.Resource_Quantity ;;
  }

  dimension: resource_unit_price {
    type: number
    sql: ${TABLE}.Resource_Unit_Price ;;
  }

  dimension: resource_vendor_name {
    type: string
    sql: ${TABLE}.Resource_Vendor_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [resource_item_name, resource_vendor_name, projects.project_id]
  }
}
