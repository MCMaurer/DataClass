fluidPage( titlePanel("ZOMBIE BUGS!"), 
           sidebarLayout( 
             sidebarPanel(
                sliderInput("lower_limit",
                           label = "Lower Plot Limit for Cannibalism Rate:",
                           min = 0, max = 0.9, step = 0.02, value = 0)),
             mainPanel(
                plotOutput(outputId = "main_plot"),
                br(),
                dataTableOutput("myTable")
                        )
  )
)
  


