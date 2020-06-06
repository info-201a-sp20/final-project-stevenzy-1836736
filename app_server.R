# server.R
library(shiny)
library(shinyWidgets)
library(dplyr)
library(ggplot2)
library(maps)
library(plotly)
library(sp)
library(maptools)

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
    

    output$plot1 <- renderPlotly({
      selected_data <- tuition %>%
        filter(type == input$Type)
      plot1 <- ggplot(data = selected_data) +
        geom_point(mapping = aes(x = in_state_total, y = out_of_state_total, color = type)) +
        labs(
          title = "In-state vs Out-of-State Tuition",
          x = "In-State Tuition",
          y = "Out-of-State Tuition"
        )
      plot1 <- ggplotly(plot1)
    })
    
    output$map <- renderLeaflet({
      new_df <- tuition %>%
        filter(state == input$state)
      
      in_state <- tuition %>%
        group_by(state) %>%
        summarize(avg_in_state = mean(in_state_tuition)) %>%
        pull(avg_in_state)
      
      out_state <- tuition %>%
        group_by(state) %>%
        summarize(avg_out_state = mean(out_of_state_tuition)) %>%
        pull(avg_out_state)
      
      new_df %>%
        leaflet() %>%
        addTiles() %>%
        addPolygons(
          popup = ~paste("Average In-state Tuition:", avg_in_state, ";",
                         "Average Out-state Tuition:", avg_out_state),
          fillColor = topo.colors(5, alpha = NULL),
          stroke = FALSE
        )
    })
    
    output$info <- renderText({
      filtered_df <- tuition %>%
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