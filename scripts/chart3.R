library(ggplot2)
library(dplyr)
library(lintr)

# Returns a graph that shows in-state tuition vs degree length, 
# separated by type of universities.
bin_plot <- function(df) {
  instate_vs_degree_length <- ggplot(data = df) +
    geom_bin2d(mapping = aes(x = degree_length, y = in_state_total)) +
    facet_wrap(~type) +
    labs(
      title = "In-state tuition v Degree Length ",
      x = "degree length",
      y = "In-state Tuition"
    )
  return(instate_vs_degree_length)
}
