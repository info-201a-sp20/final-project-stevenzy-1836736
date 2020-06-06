
df <- read.csv("../../data/tuition_cost.csv", stringsAsFactors = F)

states <- unique(df$state)
ui <- fluidPage(
  h2("Tuition Information"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(
        inputId = "college",
        label = "Enter your college of interest 
        (pay attention to your spelling, for example, 
        try 'University of Washington'."),
      textOutput(outputId = "info"),
      
      selectInput(
        inputId = "state",
        label = "Choose your state of interest",
        choices = states
      )
    ),
  
    mainPanel(
      leafletOutput(outputId = "map")
    )
  )
)

