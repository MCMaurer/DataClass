
## Can also put all this stuff into a global.R file. In global.R you can include source() which allows
## you to call to lots of other files to get functions, data, etc.

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


