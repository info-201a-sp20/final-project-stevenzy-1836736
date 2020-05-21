library(ggplot2)
library(dplyr)

tuition <- read.csv("tuition_cost.csv", stringsAsFactors = FALSE)

filtered <- filter(tuition, !is.na(room_and_board))

# Returns a graph that shows in-state tuition vs degree length, separated by type of universities.
instate_vs_degree_length <- ggplot(data = filtered) +
  geom_bin2d(mapping = aes(x = degree_length, y = in_state_total)) +
  facet_wrap(~type) +
  labs(
    title = "In-state tuition v Degree Length ",
    x = "degree length",
    y = "In-state Tuition"
  )

