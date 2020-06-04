library("leaflet")
library("dplyr")

df <- read.csv("../../data/tuition_cost.csv", stringsAsFactors = F)

server <- function(input, output) {
  
  output$map <- renderLeaflet({
    
    avg_in_state <- df %>%
      group_by(state) %>%
      summarize(avg_in_state = mean(in_state_tuition))
    
    avg_out_state <- df %>%
      group_by(state) %>%
      summarize(avg_out_state = mean(out_of_state_tuition))

    leaflet(df) %>%
      addProviderTiles("Stamen.TonerLite") %>%
      addCircleMarkers(
        lat = ~lat,
        lng = ~long,
        label = ~paste("Average In-state Tuition:", avg_in_state,
                       "Average Out-state Tuition:", avg_out_state),
        radius = 6,
        stroke = FALSE
      )

  })
  
  output$info <- renderText({
    filtered_df <- df %>%
      filter(name == input$college)
    
    in_state_tuition <- filtered_df %>%
      pull(in_state_tuition)
    
    out_of_state_tuition <- filtered_df %>%
      pull(out_of_state_tuition)
    
    msg <- paste0("The in-state tuition of ", input$college, " is $",
                  in_state_tuition, ".",
                  " And the out-state tuition of ", input$college, " is $",
                  out_of_state_tuition, ".")
    
    return(msg)
      
  })
}
