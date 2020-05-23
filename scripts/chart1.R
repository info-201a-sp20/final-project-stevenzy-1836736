library(ggplot2)



# returns a graph that plots in-state tuition and out-state tuition.
point_plot <- function(df) {
  in_state_vs_out_state <- ggplot(data = df) +
    geom_point(mapping = aes(x = in_state_total, y = out_of_state_total,
                             color = type)) +
    labs(
      title = "In-state tuition v Out-state tuition",
      x = "In-state Tuition",
      y = "Out-state Tuition"
    )
  return(in_state_vs_out_state)
}
