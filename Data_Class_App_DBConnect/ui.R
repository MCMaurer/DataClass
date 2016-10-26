##ui.R
fluidPage( titlePanel("ZOMBIE BUGS!"), 
           sidebarLayout( 
             sidebarPanel(
               textInput("DB_Name", label = "Database", value = "Geocoris"),
               textInput("UserName", label= "User Name", value = "postgres"),
               passwordInput("Password", label="Password"),
               textInput("query", label = "SQL Query", value = "SELECT field_surveys.sampling_date, field_surveys.field, field_surveys.crop, 
                         cannibalism_assays.bug_id, cannibalism_assays.healthy,cannibalism_assays.cannibalized,
                         cannibalism_assays.partial_,cannibalism_assays.crushed, cannibalism_assays.species
                         FROM field_surveys FULL OUTER JOIN cannibalism_assays ON (sampling_id = survey_id);"),
               actionButton("Connect", label = "Connect Database"),
               #  actionButton("plot", label = "Generate Plot"),
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