library(shiny)
library(ggplot2)

activedata<-trees

shinyServer(function(input, output) { 
# make user specific variables
output$text <- renderText({
input$title
}) 
output$input_x <- renderPrint({input$x})
output$input_y <- renderPrint({input$y})
output$plot <- renderPlot({
xvar <- activedata[ , input$x]
yvar <- activedata[ , input$y]
plotdata<-data.frame(xvar,yvar)
ggplot(data=plotdata, aes(x=xvar, y=yvar)) + geom_point(shape=21, size=4, fill="orange", color="black") + 
        theme(legend.position="none") + ggtitle("Tree Data for Black Cherry Trees") +
        theme(plot.title = element_text(size=20, face="bold")) + 
        xlab(input$x) + theme(axis.title.x = element_text(size=16)) +
        ylab(input$y) + theme(axis.title.y = element_text(size=16)) + 
        geom_smooth(method=lm, se=FALSE, color="blue", size=1)
        })
# output$regression<-reactive({
#         summary(lm(activedata[ , input$y]~activedata[ , input$x]))
#         })
regression <- reactive({
        lm(as.formula(paste(input$y," ~ ",paste(input$x,collapse="+"))),data=activedata)
        })
output$fit <- renderTable({
        summary(regression())$coefficients
        })
})