# ui.R
library(shiny)
library(shinyWidgets)
library(dplyr)
library(ggplot2)
library(maps)
library(leaflet)
library(plotly)

tuition <- read.csv("data/tuition_cost.CSV", stringsAsFactors = FALSE)
tuition <- filter(tuition, !is.na(tuition$room_and_board))
college_type <- unique(tuition$type)
allstate_df <- tuition %>%
  filter(!is.na(tuition$state))
all.state <- unique(allstate_df$state)


ui <- navbarPage( 
  title = "The US College Tuition Analysis",
  #Introduction page
  tabPanel("Introduction",
    mainPanel(
      tags$h3("Overview"),
      tags$p("This interactive report is generated to explore the data of tuition
             and fees by college/university for 2018-2019, along with school type,
              degree length, state, in-state vs out-of-state."),
      img( src="tuition.JPG",height = 350, width = 450), 
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
                       three different school types in different states.")),
      tags$li("Is there any difference between in and out-of state tuition
              for each type of school? If so, how different?",
              tags$ul("To answer this question, we used a visualization by plotting
                      total in-state tuition vs total out-of-state tuition to see
                      the relationship between them.")),
      tags$li("Question 3",
              tags$ul("To answer this question, we used ...")),
      setBackgroundColor(
        color = "LightBlue",
        gradient = c("linear", "radial"),
        direction = c("bottom", "top", "right", "left"),
        shinydashboard = FALSE
      )
    )
  ),
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
        plotlyOutput("PiePlot"),
        tags$p("The purpose of this pie chart is to show the number of proportion of three
             different types of school: Public, Private, and For profit in different states.
             Users could choose their like of state and find out the result. ")
    ))),
    
    
    tabPanel(
      "Scatterplot",
      titlePanel("Visual Representation of the Difference between in vs out State Tuition by Public and Private College"),
      p(
        "The following graph shows in-state and out-of-state tuition separately of public, private, and for-profit colleges."
      ), 
      
      sidebarLayout(
        sidebarPanel(
          # select the type of user's interest
          selectInput(inputId = "Type",
                      label = "Choose the type of college of your interest",
                      choices = college_type), width = 4),
        
        mainPanel(
          plotlyOutput(outputId = "plot1")
        )
      )
    ),
)
      