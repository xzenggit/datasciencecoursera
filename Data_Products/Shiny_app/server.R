
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
data(mtcars)

shinyServer(function(input, output) {

  # do linear regression
   my_select <- reactive({
    mtcars[,input$select]
  })
  
  output$distPlot <- renderPlot({
  
    plot(my_select(),mtcars$mpg, xlab="Selected variable", ylab="MPG")
    # plot linear regression results
    abline(lm(mtcars$mpg~my_select()),col="red")
  })
  
})
