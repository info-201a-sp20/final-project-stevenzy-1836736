library("shiny")
library("leaflet")
library("dplyr")

source("myui.R")
source("myserver.R")

df <- read.csv("../../data/tuition_cost.csv", stringsAsFactors = F)

shinyApp(ui = ui, server = server)
