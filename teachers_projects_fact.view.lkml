view: teachers_projects_fact {
    derived_table: {
      explore_source: projects {
        column: project_id {}
        column: latest_project_posted_date {}
      }
    }
    dimension: teacher_id {}
    dimension: project_id {}
    dimension: school_id {}
    dimension: project_posted_date {
      type: date
    }



}
