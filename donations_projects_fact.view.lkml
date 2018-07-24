# If necessary, uncomment the line below to include explore_source.
# include: "xin_donorschoose.model.lkml"

view: donations_projects_fact {
  derived_table: {
    explore_source: donations {
      column: project_id { field: projects.project_id }
      column: donation_amount {}
      column: count { field: donors.count }
    }
  }
  dimension: project_id {}
  dimension: donation_amount {
    value_format: "$#.##0"
    type: number
  }
  dimension: count {
    type: number
  }
}
