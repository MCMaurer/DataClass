##global.R
library(RPostgreSQL)
library(ggplot2)
library(dplyr)
library(tidyr)
library(plotly)
library(cowplot)
library(DT)

drv <- dbDriver("PostgreSQL")