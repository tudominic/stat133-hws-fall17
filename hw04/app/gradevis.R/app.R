#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggvis)
library(dplyr)
source('function.R')
# Define UI for application that draws a histogram
ui <- fluidPage(
   titlePanel("Grade Visualizer"),
   sidebarLayout(
      sidebarPanel( 
        selectInput("select", label = h3("X variable"), 
                                choices = list("HW1" = "HW1", 
                                               "HW2" = "HW2",
                                               "HW3" = "HW3",
                                               "HW4" = "HW4",
                                               "HW5" = "HW5",
                                               "HW6" = "HW6",
                                               "HW7" = "HW7",
                                               "HW8" = "HW8",
                                               "HW9" = "HW9",
                                               "ATT" = "ATT",
                                               "QZ1" = "QZ1",
                                               "QZ2" = "QZ2",
                                               "QZ3" = "QZ3",
                                               "QZ4" = "QZ4",
                                               "Test1" = "Test1",
                                               "Test2" = "Test2"),
                                selected = "HW1"),
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 10,
                     value = 30),
        radioButtons("scale", label = h3("choose scale"),
                     choices = list("none" = 1, 
                                    "std units" = 2, 
                                    "scale" = 3), 
                     selected = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         #plotOutput("distPlot")
        tabsetPanel(type = "tabs",
                    tabPanel("Barchart", value = 1, 
                             ggvisOutput("barchart")),
                    tabPanel("Histogram", value = 2, 
                             ggvisOutput("histogram")),
                    id = "tabselected")
      )
   )
)

server <- function(input, output) {
  vis_barchart <- reactive({
    var1 <- prop("x", as.symbol(input$select))
    dat %>% 
      ggvis(x = var1, fill := "#ef623b") %>% 
      add_axis("y", title = "frequency")
  })
  vis_barchart %>% bind_shiny("barchart")
   
  output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- dat[, input$select] 
      if (input$scale == 1) {
        x
      } else if (input$scale == 2) {
        x <- standardize(x)
      } else {
        x <- rescale(x)
      }
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      hist(x, breaks = bins, col = 'darkgray', border = 'white',
           main = input$select, xlab = input$select)
   })
   output$text <- renderText({
     fileText <- paste(readLines(("../output/Homework-stats.txt")))
     fileText
   })
   
   vis_histogram <- reactive({
     var2 <- prop("x", as.symbol(input$select))
     
     dat %>% 
       ggvis(x = var2, fill := "#abafb5") %>% 
       layer_histograms(stroke := 'white',
                        width = input$bins)
   })
   vis_histogram %>% bind_shiny("histogram")
}

# Run the application 
shinyApp(ui = ui, server = server)
