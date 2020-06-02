# ui.R
library(shiny)

ui <- fluidPage(
  titlePanel("The US College Tuition Analysis",
             windowTitle = "College tuition explorer"),
  tags$img(src='data/tuition.png', width=300),
  tags$p("This interactive report is generated to explore the data of tuition
          and fees by college/university for 2018-2019, along with school type,
          degree length, state, in-state vs out-of-state"),
  tags$br(),
  tags$p("Major questions that you can find answers in this report:"),
  tags$li("What is geographical distribution like with regard to
           different school types?",
          tags$ul("To answer this question, we used locations of
                  three different school types in different states")),
  tags$li("Question 2",
          tags$ul("To answer this question, we used ")),
  tags$li("Question 3",
          tags$ul("To answer this question, we used "))
)
