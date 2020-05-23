# Aggregate Table

# load packages
library("dplyr")
library("knitr")

# Also include this description in the index.Rmd file:
# The purpose of this table is to compare the total cost of students by
# finding the difference of in-state total cost and out-of-state total cost. 
# The table is also sorted by the cost difference, from the highest to lowest,
# so we can see which college has the highest difference between in-state cost
# and out-state cost from the table. 
# This table groups the college tuitions by its type, such as 'Public',
# 'Private', and 'For Profit'. So we can see more clearly the differece between
# each type of college and this group helps us get information easier from the 
# table based on their types. 

# function to return a table
table_function <- function(df) {
  new_df <- df %>%
    select(name, state, type, in_state_total, out_of_state_total) %>%
    mutate(cost_diff = out_of_state_total - in_state_total) %>%
    group_by(type) %>%
    arrange(-cost_diff)
  
  table <- kable(new_df, col.names = c(
    "Name",
    "State",
    "Type",
    "In-state Cost",
    "Out-state Cost",
    "Difference"))
  return(table)
}
