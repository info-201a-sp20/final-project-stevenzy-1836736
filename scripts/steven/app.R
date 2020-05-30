library("shiny")
library("plotly")

#load the ui and server
source("myui.R")
source("myserver.R")
source("chart1.R")

shinyApp(ui = ui, server = server)