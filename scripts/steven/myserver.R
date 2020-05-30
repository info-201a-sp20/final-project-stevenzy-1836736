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
  
  
  
  
  output$demoplotly <- renderPlotly({
    plot1 <- ggplot(data = read.csv("tuition_cost.csv", stringsAsFactors = F)) +
                    geom_point(mapping = aes(x = in_state_total, y = out_of_state_total, color = type)) +
      labs(
        title = "In-state vs Out-of-State Tuition",
        x = "In-State Tuition",
        y = "Out-of-State Tuition"
      )
    plot1 <- ggplotly(plot1)
  })
  

}
