# ui.R
library(shiny)
library(shinyWidgets)
library(dplyr)
library(ggplot2)
library(maps)
library(leaflet)

tuition <- read.csv("data/tuition_cost.CSV", stringsAsFactors = FALSE)
all.state <- unique(tuition$state)



ui <- navbarPage( 
  title = "The US College Tuition Analysis",
  #Introduction page
  tabPanel("Introduction",
  mainPanel(
  tags$img("tuition image", src="data/tuition.jpg"), 
  tags$h3("Overview"),
  tags$p("This interactive report is generated to explore the data of tuition
          and fees by college/university for 2018-2019, along with school type,
          degree length, state, in-state vs out-of-state."),
  tags$h3("Where the data is from:"),
  tags$p("The data come from many different sources but originally US Department 
         community with powerful tools and resources to help users achieve their
         data science goals. The dataset was found ",
         tags$a(href="https://www.chronicle.com/interactives/tuition-and-fees",
                "The Cronicle of Higher Education"),),
  tags$h3("Questions:"),
  tags$p("Major questions that you can find answers in this report:"),
  tags$li("What is geographical distribution like with regard to
           different school types?",
          tags$ul("To answer this question, we used locations of
                  three different school types in different states")),
  tags$li("Question 2",
          tags$ul("To answer this question, we used ")),
  tags$li("Question 3",
          tags$ul("To answer this question, we used ")),
  setBackgroundColor(
    color = "LightBlue",
    gradient = c("linear", "radial"),
    direction = c("bottom", "top", "right", "left"),
    shinydashboard = FALSE
  )
)),
  tabPanel(
    "Pie Chart",
    titlePanel("What is each type of school like in different state?"),
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
)


