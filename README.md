# Final Project
Use this `REAMDE.md` file to describe your final project (as detailed on Canvas).

## Domain of Interest
- Our domain of interest is related to college. One reason that we are interested in this topic is because we are college students ourselves and we care the most with this
domain. And the related data driven projects we chose are all involved within our daily lives.
- Other data driven projects related to our domain of interest are tuition of college students, information of college basketball, and college majors.
- https://www.kaggle.com/jessemostipak/college-tuition-diversity-and-pay
https://www.kaggle.com/andrewsundberg/college-basketball-dataset
https://www.kaggle.com/fivethirtyeight/fivethirtyeight-college-majors-dataset
- In the college tuition project, the data shows information about different colleges, including their state, cost of room and board, in-state and out-of-state tuitions, and so on. In the college basketball project, the data shows the college students who plays the basketball, the number of games they played, the number of games they won, and so on. In the college major project, the data shows the major category, number of enrollment, unemployment rate, employment rate, and so on.
- Which college has the highest tuition?
Which college has the highest rate of win?
Which majors' employment rates are higher than food science?
- Which colleges have their in-state-tuition higher than $15,000?
- To answer this question, we need to use dplyr. We should use the filter function to filter out the rows that fulfills the condition, and then use the pull function to get the names of the colleges. 

## Finding Data
Tuition
- URL: https://www.kaggle.com/jessemostipak/college-tuition-diversity-and-pay
- How data collected: The data came from the _US Department of Education_ (link: TuitionTracker.org). The tuition and fee data is for college/university between 2018-2019.
- Rows: 2973
- Cols: 10
- Questions that this data can answer: Which state Adrian College is in? How much was the in-state tuition for Cornell University? How many rooms were there at Delta College?

College Basketball
- URL: https://www.kaggle.com/andrewsundberg/college-basketball-dataset
- How data collected: Data for each year are from http://barttorvik.com/trankpre.php and combined into cbb.csv
- Rows: 1758
- Cols: 24
- Questions that this data can answer: Which college has the highest rate of win? Which college has the best power rating? What's the chance of University of North Carolina beating Duke University?

College major
- URL: https://www.kaggle.com/fivethirtyeight/fivethirtyeight-college-majors-dataset
- How data generated: The data comes from **fivethirtyeight** hosted on their github. This data is updated on a daily basis.
- Rows: 173
- Columns: 11
- Questions that this data can answer:
  1. Which major category does the specific major belong to?
  2. What is the unemployed rate of a major?
  3. How many people are enrolled in a major?
