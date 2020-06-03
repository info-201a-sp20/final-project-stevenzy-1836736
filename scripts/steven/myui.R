tuition <- read.csv("tuition_cost.CSV", stringsAsFactors = FALSE)
tuition <- filter(tuition, !is.na(tuition$room_and_board))
college_type <- unique(tuition$type)


ui <- fluidPage(
  h1("Visual Representation of the Difference between in vs out State Tuition by Public and Private College"), 
  p(
    "The following graph shows the public colleges in __ ",
    strong("bold"),
    " text."
  ), 
  
  sidebarLayout(
    sidebarPanel(
      # select the type of user's interest
      selectInput(inputId = "Type",
                  label = "Choose the type of college of your interest",
                  choices = college_type), width = 4),
    
     mainPanel(
       plotlyOutput(outputId = "plot1"))
   )
  
  
)
