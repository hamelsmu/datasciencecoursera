#shinyProject For Data Products Coursera

library(shiny)
data(mtcars)

shinyUI(fluidPage(
  titlePanel("Cars Dataset Scatterplot App"),
  
  sidebarLayout(
    sidebarPanel( h4(strong("Configure Chart Options")),
                  br(),
    
    selectInput("X", 
                label = strong("Choose variable for X axis."), 
                choices = as.list(names(mtcars)),
                selected = 'mpg'
                ),
    
    selectInput("Y", 
                label = strong("Choose variable for Y axis."),
                choices = as.list(names(mtcars)),
                selected = 'hp'
                ),
    
    selectInput("C", 
                label = strong("Select variable to color data points by"), 
                choices = as.list(names(mtcars)),
                selected = 'cyl'
    ),
    
    selectInput("T", 
                label = strong("Choose Theme"),
                choices = as.list(c('calc','economist', 'excel', 'few', 'gdocs', 'solarized', 'stata', 'tufte', 'wsj'
                                    )),
                selected = 'few'
    ),
    
    br(),
    strong('How to use this app:'),
    br(),
    helpText("This is an app that allows you to create scatterplots from the mtcars dataset.  
             You can choose variables from this dataset for the X-axis, Y-axis, and color of the scatterplot.
              Finally, you can select a theme for the graph.  These themes come from https://github.com/jrnold/ggthemes, which
              are kind of neat themes for ggplot2 graphs."), 
    br(),
    helpText("Additionally, this scatterplot fits a loess smoother and prints out the correlation coefficient of the X & Y variables.  I 
             used the reactive function for calculating the correlation coefficient.  Code for this shiny application is located at the link below:"),
    HTML('<a href=https://github.com/hamelsmu/datasciencecoursera/tree/master/DataProducts/ScatterPlot>link</a>')

    
  ), 
  
  
  mainPanel(
    plotOutput("plot1"),
    br(),
    strong("Correlation Coefficient b/w Selected X & Y Variables - (Uses Reactive Function)"),
    textOutput("text1")
    )
  )
))