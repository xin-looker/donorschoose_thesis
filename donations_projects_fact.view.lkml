view: donations_projects_fact {
    derived_table: {
      sql: WITH donations_projects_fact AS (SELECT
        projects.Project_ID  AS project_id,
        schools.School_State  AS schools_school_state,
        COUNT(DISTINCT donors.donor_id ) AS donors_count
      FROM donorschoose.donations  AS donations
      LEFT JOIN donorschoose.projects AS projects ON donations.Project_ID = projects.Project_ID
      LEFT JOIN donorschoose.donors  AS donors ON donations.Donor_ID = donors.donor_id
      LEFT JOIN donorschoose.schools  AS schools ON projects.School_ID = schools.School_ID
      where donors.donor_state = schools.school_state
      GROUP BY 1,2
      ORDER BY 3 DESC
       )
SELECT
  projects.Project_ID  AS project_id,
  donations_projects_fact.schools_school_state  AS school_state,
  donations_projects_fact.donors_count  AS same_state_donors_count,
  COUNT(DISTINCT donors.donor_id ) AS donors_count
FROM donorschoose.donations  AS donations
LEFT JOIN donorschoose.projects AS projects ON donations.Project_ID = projects.Project_ID
LEFT JOIN donorschoose.donors  AS donors ON donations.Donor_ID = donors.donor_id
LEFT JOIN donations_projects_fact ON donations.Project_ID= donations_projects_fact.project_id

GROUP BY 1,2,3
ORDER BY 4 DESC
 ;;
    }

    # measure: count {
    #   type: count
    #   drill_fields: [detail*]
    # }

    dimension: project_id {
      type: string
      primary_key: yes
      hidden: yes
      sql: ${TABLE}.project_id ;;
    }

    dimension: school_state {
      type: string
      hidden: yes
      sql: ${TABLE}.school_state ;;
    }

    dimension: same_state_donors_count {
      type: number
      sql: ${TABLE}.same_state_donors_count ;;
    }

    dimension: donors_count {
      type: number
      sql: ${TABLE}.donors_count ;;
    }

    measure: same_state_donor_percentage {
      type: average
      sql: ${same_state_donors_count}/${donors_count} ;;
      value_format_name: percent_1
      drill_fields:[detail*]
    }

    set: detail {
      fields: [project_id, school_state, same_state_donors_count, donors_count]
    }
  }
