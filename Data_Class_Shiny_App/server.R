function(input, output) {

 output$main_plot <- 
     output$main_plot <- renderPlot({
       myData %>% 
        filter(cannibalism_rate >= input$lower_limit) %>%
          ggplot(aes(x=field, y=cannibalism_rate, fill = crop))+
          geom_violin()+
          theme(axis.text.x = element_text(angle = 90, hjust = 1)) })
 
 output$myTable <- renderDataTable(myData %>% filter(cannibalism_rate >= input$lower_limit) )
}


