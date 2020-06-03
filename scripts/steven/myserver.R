source("chart1.R")
df <- read.csv("tuition_cost.csv", stringsAsFactors = F)


server <- function(input, output) {
  output$message <- renderText({
    msg <- paste0("You've chosen option #", input$radioInput, 
      ". You've entered the following text: ", input$textInput)
    return(msg)
  })
  

  output$college_types <- renderUI({
    type_college <- unique(df$type)
 #   type_college <- statewise_college[order(statewise_college)]
    selectInput('school', label = "College Option (Select or Type)", 
                choices =  c("", as.list(type_college)), 
                multiple = F, selected = F)
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
  
  
  output$PiePlot <- renderPlotly({
     selected_data <- tuition %>%
       filter(type == input$Type)
    
    public <- tuition %>%
      filter(type == "Public")%>%
      nrow()
    
    private <- tuition %>%
      filter(type == "Private")%>%
      nrow()
    
    profit <- tuition %>%
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
