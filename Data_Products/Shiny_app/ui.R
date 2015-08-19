
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("MPG prediction based on mtcars dataset"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("select", label=h3("Please select one variable:"),
                  choices=c("Weight"="wt", "Transmission"="am", "Cylinders"="cyl")),
      submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h4("MPG linear regression result"),
      plotOutput("distPlot"), 
        h4("Instruction"),
      helpText("This application is designed to test regression of mpg 
               with different variables in the mtcars dataset."),
      helpText("You can check different variable on the right panel.",
               "The app will show different regression results according to your choice."),
      helpText("Detailed explaination of the dataset can be found",
               a("here", href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html"),
               ".")
    )
  )
))
