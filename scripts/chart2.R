library(ggplot2)
library(dplyr)

tuition <- read.csv("tuition_cost.csv", stringsAsFactors = FALSE)

# pass "filtered" as param
filtered <- filter(tuition, !is.na(room_and_board))

# returns a graph that plots in-state tuition and room & board.
hex_plot <- function(df) {
  room_vs_instate <- ggplot(data = df) +
    geom_hex(mapping = aes(x = room_and_board, y = in_state_total)) +
    labs(
      title = "Tuition v Room ",
      x = "Room and Board",
      y = "In-state Tuition"
    )
  return(room_vs_instate)
}
