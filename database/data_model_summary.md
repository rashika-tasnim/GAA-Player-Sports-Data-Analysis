Database Design

The project uses a relational model with one main fact table and several dimension tables. The structure separates repeated information such as players, guardians, clubs, teams, sports, activities, dates, and submission types.

This design reduces duplication compared with analysing the original flat CSV file directly and supports more flexible SQL reporting.

Example Analysis Questions

The SQL reporting queries explore questions such as:

Which clubs have the highest number of player records?
What is the gender distribution of players?
How are players distributed across sports or activities?
Which team age groups are most common?
How does football participation vary by age group and gender?
Which counties have the highest number of records?
How many submissions are self-submissions versus dependent submissions?