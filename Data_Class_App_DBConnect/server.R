##server.R

function(input, output) {
  myTable <- eventReactive(input$Connect, {
    con <- dbConnect(drv, dbname = input$DB_Name, host = "localhost",
                     user = input$UserName, password = input$Password)
    myData <- dbGetQuery(con, input$query)
    myData$cannibalism_rate <- myData$cannibalized / (myData$healthy + myData$cannibalized)
    myData$cannibalism_rate[is.na(myData$cannibalism_rate)] <- 0
    myData # this is what actually gets plugged into myTable
  })
  
  output$main_plot <- #eventReactive(input$plot, {
    output$main_plot <- renderPlot({
      myTable() %>% ## myTable has to have () because it's a reactive
        filter(cannibalism_rate >= input$lower_limit) %>%
        ggplot(aes(x=field, y=cannibalism_rate, fill = crop))+
        geom_violin()+
        theme(axis.text.x = element_text(angle = 90, hjust = 1)) })
  
  output$myTable <- renderDataTable(myTable() %>% filter(cannibalism_rate >= input$lower_limit) )
  # })
}


