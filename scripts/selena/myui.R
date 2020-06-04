# Question: What is the in-state tuition and out-of-state tuition of a college? (map)
# What is the average tuition of a chosen state? (table)

df <- read.csv("../../data/tuition_cost.csv", stringsAsFactors = F)

states <- unique(df$state)
ui <- fluidPage(
  h2("Tuition Information"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(
        inputId = "college",
        label = "Enter your college of interest"
      )
    ),
  
    mainPanel(
      leafletOutput(outputId = "map"),
      tableOutput(outputId = "table")
    )
  )
)

