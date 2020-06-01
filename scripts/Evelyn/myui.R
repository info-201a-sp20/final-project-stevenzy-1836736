library("dplyr")
library("ggplot2")
library("maps")
library("leaflet")
library(shiny)

tuition <- read.csv("tuition_cost.CSV", stringsAsFactors = FALSE)
all.state <- unique(tuition$state)

myui <- fluidPage(
  "Pie Chart",
  sidebarLayout(
    sidebarPanel(
      # select the state of user's interest
      selectInput(inputId = "State",
                  label = "Choose the State of your interest",
                  choices = all.state), width = 4
      ), 
    
    mainPanel(
      plotlyOutput("PiePlot"))
    )
)


myserver <- function(input, output){
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


shinyApp(ui = myui, server = myserver)


