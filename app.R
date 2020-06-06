# Load libraries so they are available
library(shiny)
library(dplyr)
library(ggplot2)
library(maps)
library(leaflet)
library(plotly)

source("app_ui.R")
source("app_server.R")

shinyApp(ui=ui, server=server)
