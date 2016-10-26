library(ggplot2)
library(dplyr)
library(tidyr)
library(plotly)
library(cowplot)
library(DT)
library(shiny)

myData <- read.csv("data/Geocoris_Joined_Table_From_DB_Try_2")
myData$cannibalism_rate <- myData$cannibalized / (myData$healthy + myData$cannibalized)
myData$cannibalism_rate[is.na(myData$cannibalism_rate)] <- 0
