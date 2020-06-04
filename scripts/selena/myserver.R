library("leaflet")
library("dplyr")

df <- read.csv("../../data/tuition_cost.csv", stringsAsFactors = F)

popup_info <- df %>%
  group_by(state) %>%
  mutate(avg_in_state = mean(in_state_tuition),
         avg_out_state = mean(out_of_state_tuition))

server <- function(input, output) {
  
  output$map <- renderLeaflet({

    leaflet(df) %>%
      addProviderTiles("Stamen.TonerLite") %>%
      addCircleMarkers(
        lat = ~lat,
        lng = ~long,
        radius = 5,
        popup = ~paste0("In-state Tuition Average: ", avg_in_state, "<br>",
                       "Out-of-state Tuition Average: ", avg_out_state),
        
        stroke = FALSE
      )
  })
}
