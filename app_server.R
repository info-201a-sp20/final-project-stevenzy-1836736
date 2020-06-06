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
    
    
    # The interactive map page output
    # displaying the map
    output$map <- renderLeaflet({
      
      # pull the average in-state tuition of each state
      in_state <- tuition %>%
        group_by(state) %>%
        summarize(avg_in_state = mean(in_state_tuition)) %>%
        pull(avg_in_state)
      # pull the average out-of-state tuition of each state
      out_state <- tuition %>%
        group_by(state) %>%
        summarize(avg_out_state = mean(out_of_state_tuition)) %>%
        pull(avg_out_state)
      
      # displaying the map
      map <- leaflet(data = tuition) %>%
        addProviderTiles("CartoDB.Positron") %>%
        addMarkers(
          lat = ~lat,
          lng = ~long,
          popup = ~paste("State:", state,
                         "Average In-state Tuition:", round(in_state), 
                         "Average Out-state Tuition:", round(out_state), sep = "<br>")
        )
    })
    
    # returning text about the tuition information of the input college
    output$info <- renderText({
      # filter the original dataframe, matching the input college with 
      # that in the tuition data frame
      filtered_df <- tuition %>%
        filter(name == input$college)
      
      # get the in-state tuition of the input college
      in_state_tuition <- filtered_df %>%
        pull(in_state_tuition)
      
      # get the out-of-state tuition of the input college
      out_of_state_tuition <- filtered_df %>%
        pull(out_of_state_tuition)
      
      # return the message that will be shown on the page
      msg <- paste0("The in-state tuition of ", input$college, " is $",
                    in_state_tuition, ".",
                    " And the out-state tuition of ", input$college, " is $",
                    out_of_state_tuition, ".")
      
      return(msg)
      
    })
}