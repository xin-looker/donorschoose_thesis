# Donorschoose Thesis Write Up

## **Where I got the data**
The dataset in this analysis is from Kaggle [Data Science For Good](https://www.kaggle.com/donorschoose/io/home)'s challenge. This is a transactional dataset which includes all the record of Donorschoose platform users, projects and donations.

**Background about Donorschoose**
Founded in 2000 by a Bronx history teacher, DonorsChoose.org has raised $685 million for America's classrooms. Teachers at three-quarters of all the public schools in the U.S. have come to DonorsChoose.org to request what their students need, making DonorsChoose.org the leading platform for supporting public education.

To date, 3 million people and partners have funded 1.1 million DonorsChoose.org projects. But teachers still spend more than a billion dollars of their own money on classroom materials. To get students what they need to learn, the team at DonorsChoose.org needs to be able to connect donors with the projects that most inspire them.

**The aim of this project**
The aim of this project is to get an insight of the current and past donors and projects so with this information we can create a email marketing strategy to motivate donors to donate again.

## **What questions I want to answer with this dataset**

1. Who are the donors?
 * Who are the top donors in terms of value & times?
 * Who are once off donors? What's their donated value?
 * What's donors' retention?
2. What projects that donors are interested in?
 * Categorising all projects based on type, location and performances;
 * Are donors more interested in projects/schools in their state/city?
 * Find the most donated projects, cost/donation, type of projects,location etc.;
3. Teachers
  * How are the teachers?
  * What's teachers' retention?
  * Ambassadors: Which teachers are quite successful in their projects?
  * Which teachers do we want to follow up? How to categorise them?
4. Resources: How is this relating to donations?
* Overview of resources
* Are donors have reference on certain types of resources?

## **The structure of the data and how I choose to model it**
The data was in CSV format, which has been uploaded into Bigquery. The raw model was already well structured with 6 tables: projects, donations. donors, resources, schools and teachers.

<img src="https://image.ibb.co/jbATW8/donorschoose_original_schema.png" alt="donorschoose_original_schema" border="0">

In order to understand the insight on projects, teachers and donors fact, I created three derived tables: *"donations_fact"*, *"donations_projects_fact"* and *"teachers_retention_fact"*. These three tables are used to aggregate measures and provide statistical info.




## **Future questions/thoughts for this dataset**
The original purpose of this Kaggle challenge is to create a solution to recommand projects to users who have donated similar projects before. The model has to be improved to fit into this purpose.
Also, a lot of projects fields are long text and articles, which can be further analysed, while it also requires extensive ETL.



_________________________


# Assumptions
1. Return donors tend to donote again, the more times they donate, they more likely they will return
2. Relevancy: Donors donated the first time might be interested to donate again to projects that similar to last project, including type of projects, similar request, similar location, the higher the similarity, the higher the chance
3. Urgency: Projects almost almost reaching the donations targets might motivate donors to donate
4. Different demographics donors might have different donation behaviors, age, location, gender, ocupation etc.
5. Popular projects have similarities: title patterns,
6. There could be brand ambassadors who enable a project donation campaign
