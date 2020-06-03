# server.R
library(shiny)
library(shinyWidgets)
library(dplyr)
library(ggplot2)
library(maps)
library(leaflet)

server <- function(input, output) {
  
    output$PiePlot <- renderPlotly({
      selected.data <- tuition %>%
        filter(state == input$State)
      
      public <- selected.data %>%
        filter(type == "Public")%>%
        nrow()
      
      private <- selected.data %>%
        filter(type == "Private")%>%
        nrow()
      
      profit <- selected.data %>%
        filter(type == "For Profit")%>%
        nrow()
      
      name <- c("Public", "Private", "For Profit")
      value <- c(public, private, profit)
      
      result <- data.frame(value, name)
      
      colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)')
      
      plot_ly(result, labels = ~name, values = ~value, type = 'pie') %>%
        layout(
          title = ~paste0("Percentage of each school type in state"),  
          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
        )
    })
  }
