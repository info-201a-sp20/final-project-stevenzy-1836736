
ui <- fluidPage(
  h1("Visual Representation of the Difference between in vs out State Tuition by Public and Private College"), 
  p(
    "The following graph shows the public colleges in __ ",
    strong("bold"),
    " text."
  ), 
  # h2("here are some example inputs"),
  # radioButtons(
  #   inputId = "radioInput",
  #   label = h3("Demo radio buttons"),
  #   choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
  #   selected = 1
  # ),
  # textInput(
  #   inputId = "textInput",
  #   label = h3("example text input"),
  #   placeholder = "enter your text here"
  # ),
  # textOutput(
  #   outputId = "message"
  # ),
  h2("Choose what type of college you'd like to see the result of"),
  
  

  plotlyOutput(
    outputId = "plot1"
  )
  
  
)