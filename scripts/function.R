# This file contains a function that takes in a dataset as a parameter,
#   and returns a list of information about it

# A function that takes in a tuition cost dataset and returns summary info
get_summary_info <- function(dataset) {
  ret <- list()
  # the number of colleges
  ret$length <- length(dataset)
  # The number of public schools
  ret$num_public <- length(dataset$type[dataset$type == "Public"])
  # The number of private schools
  ret$num_private <- length(dataset$type[dataset$type == "Private"])
  # The number of schools for profit
  ret$num_for_profit <- length(dataset$type
                               [dataset$type == "For Profit"])
  # The average tuition for in-state students
  ret$avg_instate_tuition <- mean(dataset$in_state_tuition, na.rm = TRUE)
  # The average tuition for out-state students
  ret$avg_out_of_state_tuition <- mean(dataset$out_of_state_tuition,
                                       na.rm = TRUE)
  # The average tuition of public colleges for in-state students
  ret$avg_instate_public <- mean(dataset$in_state_tuition
                                 [dataset$type == "Public"],
                                 na.rm = TRUE)
  # The average tuition of private colleges for in-state students
  ret$avg_instate_private <- mean(dataset$in_state_tuition
                                  [dataset$type == "Private"],
                                  na.rm = TRUE)
  # The average tuition of public colleges for out-state students
  ret$avg_outstate_public <- mean(dataset$out_of_state_tuition
                                  [dataset$type == "Public"],
                                  na.rm = TRUE)
  # The average tuition of private colleges for out-state students
  ret$avg_outstate_private <- mean(dataset$out_of_state_tuition
                                  [dataset$type == "Private"],
                                  na.rm = TRUE)
  # The university that havs the highest in-state tuition
  ret$most_expensive_instate <- dataset$name[dataset$in_state_tuition == 
                                                  max(dataset$in_state_tuition)]
  # The university that havs the highest out-state tuition
  ret$most_expensive_outstate <- dataset$name[dataset$out_of_state_tuition == 
                                                  max(dataset$out_of_state_tuition)]
  return (ret)
} 