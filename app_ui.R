# ui.R
library(shiny)
library(shinyWidgets)
library(dplyr)
library(ggplot2)
library(maps)
library(leaflet)
library(plotly)

tuition <- read.csv("data/tuition_cost.csv", stringsAsFactors = FALSE)
tuition <- filter(tuition, !is.na(tuition$room_and_board))
college_type <- unique(tuition$type)
allstate_df <- tuition %>%
  filter(!is.na(tuition$state))
all.state <- unique(allstate_df$state)

ui <- fluidPage(
  includeCSS("www/style.css"),
  navbarPage(
    tags$h1("The US College Tuition Analysis"),
    # Introduction page
    tabPanel(
      "Introduction",
      mainPanel(
        tags$h2("Overview"),
        tags$br(),
        tags$p("This interactive report is generated to explore the data of
                    tuition and fees by college/university for 2018-2019,
                    along with school type, degree length, state,
                    in-state vs out-of-state."),
        img(src = "tuition.jpg", height = 350, width = 450),
        tags$h3("Where the data is from:"),
        tags$p(
          "The data come from many different sources but originally
          US Department community with powerful tools and resources to help
          users achieve their data science goals.
                     The dataset was found ",
          tags$a(
            href = "https://www.chronicle.com/interactives/tuition-and-fees",
            "The Cronicle of Higher Education"
          ),
          "."
        ),
        tags$h3("Questions:"),
        tags$p("Major questions that you can find answers in this report:"),
        tags$li(
          "What is geographical distribution like with regard to
                     different school types?",
          tags$ul("To answer this question, we used locations of
                             three different school types in different states.")
        ),
        tags$li(
          "Is there any difference between in and out-of state tuition
                      for each type of school? If so, how different?",
          tags$ul("To answer this question, we used a visualization by plotting
                  total in-state tuition vs total out-of-state tuition to see
                  the relationship between them.")
        ),
        tags$li(
          "How can I know the in-state tuition and out-of-state tuition of each
          college and the average in-state tuition and out-of-state tuition of
          each state?",
        tags$ul("To answer this question, we used a map to make the average
          tuition popup and we used a text input box to return
          in-state tuition and out-of-state tuition based on the input
          college.")
        ),
        setBackgroundColor(
        color = "LightBlue",
        gradient = c("linear", "radial"),
        direction = c("bottom", "top", "right", "left"),
        shinydashboard = FALSE
        )
      )
    ),
    # Pie chart page
    tabPanel(
      "Pie Chart",
      titlePanel("What is each type of school like in different state?"),
      tags$br(),
      sidebarLayout(
        sidebarPanel(
          # select the state of user's interest
          selectInput(
            inputId = "State",
            label = "Choose the State of your interest",
            choices = all.state
          ),
          width = 4
        ),
        mainPanel(
          plotlyOutput("piePlot"),
          tags$p("The purpose of this pie chart is to show the number of
                      proportion of three different types of school:
                      Public, Private, and For profit in different states.
                      Users could choose their like of state and find out
                      the result.")
        )
      )
    ),

    # Scatterplot page
    tabPanel(
      "Scatterplot",
      tags$h3("Visual Representation of the Difference between in vs
               out State Tuition by Public and Private College"),
      p("The following graph shows in-state and out-of-state tuition separately
      of public, private, and for-profit colleges."),
      sidebarLayout(
        sidebarPanel(
          # select the type of user's interest
          selectInput(
            inputId = "Type",
            label = "Choose the type of college of your interest",
            choices = college_type
          ),
          width = 4
        ),
        mainPanel(
          plotlyOutput(outputId = "plot1")
        )
      )
    ),

    # Interactive map page
    tabPanel(
      "Interactive map",
      # header of the interactive map page
      tags$h3("Tuition Information"),

      sidebarLayout(
        # side panel, displaying sidebar layouts
        sidebarPanel(
          # allow users to input the college name of their interest
          textInput(
            inputId = "college",
            label = "Enter your college of interest
            (pay attention to your spelling, for example,
            try 'University of Washington'."),
          textOutput(outputId = "info")

        ),
        # main panel, displaying the map
        mainPanel(
          leafletOutput(outputId = "map"),
          tags$p("This map is intended to show the users the average in-state
                 and out-of state tuition of each state, based on which state 
                 the user clicks on.")
        )
      )
    )
    ,
    # Summary takeaways
    tabPanel(
      "Summary",
      titlePanel("Takeaways from analysis"),
      tags$br(),
      tags$p("1. According to the pie chart which shows the proportion of school
           type, in all the states, public shool and private school are the
             two major school types. And For Profit oppupies a small proportion
             of the state's school type. California is the state which has most
             number of schools among all the state. With this insignt, it is
             possible to predict the school number according to proportion in
             each state."),
      tags$p(
        "2. According to the scatterplot, almost every private school has the
        same tuition for both in-state and out-of-state student. However, for
        public schools, in-state students pay much less than out-of-state
        student.",
        tags$br(),
        "An insight drawn here is that besides the public college
        of a state a student lives in that a student can take tuition
        advantage of, every other college's tuitions cost more."
      ),
      tags$p("3. According to the interactive map page, first we can know the
             tuition information of a college (in-state tuition and out-of-state
             tuition) based on the user input of their
             interested college; then we can conclude about the
             average in-state and out-of-state tuition
             of each state by clicking on the circles,
             based on the map's popups. From this page, we can 
             then get the tuition information about the colleges
             much easier."),
      tags$h2("Authors"),
      tags$br(),
      tags$p("Evelyn Sun, Zhenyu Huang, Benji Sun, Selena Li"),
      tags$p("We are students taking INFO201 in Spring 2020")
    )
  )
)