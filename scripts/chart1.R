library(ggplot2)

tuition <- read.csv("tuition_cost.csv", stringsAsFactors = FALSE)

# returns a graph that plots in-state tuition and out-state tuition.
in_state_vs_out_state <- ggplot(data = tuition) +
  geom_point(mapping = aes(x = in_state_total, y = out_of_state_total, color = type)) +
  labs(
    title = "In-state tuition v Out-state tuition",
    x = "In-state Tuition",
    y = "Out-state Tuition"
  )
