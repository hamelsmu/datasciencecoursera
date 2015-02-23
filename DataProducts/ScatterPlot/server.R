# server.R

require(rCharts)
library(ggplot2)
library(ggthemes)
data(mtcars)
mtcars$cyl = as.factor(mtcars$cyl)
mtcars$vs = as.factor(mtcars$vs)
mtcars$am = as.factor(mtcars$am)
mtcars$gear = as.factor(mtcars$gear)
mtcars$carb = as.factor(mtcars$carb) 
x = c("")

shinyServer(function(input, output) {
  
  #########################
  #Reactive Function Here:
  #  Note - reactive function was not necessary, but included it 
  #  for puposes of this exercise as I couldn't think of a good reason for
  #  it, but it was required so I found a way to use it. 
  
  Xvar = reactive(mtcars[, c(input$X)])
  Yvar = reactive(mtcars[, c(input$Y)])
  
  output$text1 <- renderText({
    cor(Xvar(), Yvar())
  })
  
  output$plot1 <- renderPlot({ 
    

    p1 = ggplot(mtcars, aes_string(x=input$X, y=input$Y)) + 
      geom_point(aes_string(color=input$C), size = 6, alpha = .75) +
      stat_smooth(alpha = .25, lty = 2) + 
       labs(title = paste('ScatterPlot:',input$X, "vs.", input$Y), 
            x = input$X, 
            y = input$Y) 
    
    exp = paste('p2 = theme_', input$T, '()', sep = '')
    
    eval(parse(text=(exp)))
    
    
    print(p1+p2) 
    
  })
  
}
)