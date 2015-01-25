library(shiny)
library(ggplot2)

activedata<-trees

shinyUI(fluidPage( 
titlePanel("Variable Plotting and Regression for \"trees\" dataset in R"),
br(),
h4('Select Input Variables for Plotting and Regression'),
        sidebarLayout(
                sidebarPanel( 
                selectInput("x", "Select the \"X\" Variable:",
                     choices = names(activedata),
                     selected = "Girth"),
                h4('You Entered'),
                verbatimTextOutput("input_x"),

                selectInput("y", "Select the \"Y\" Variable:",
                     choices = names(activedata),
                     selected = "Volume"),
                h4('You Entered'),
                verbatimTextOutput("input_y")
                ),
                
                mainPanel(
                #h3(textOutput("text")),
                plotOutput("plot"),
                h4('Regression Summary Coefficients For Seleceted Variables'),
                #h3(textOutput("fit"))
                #verbatimTextOutput("fit")
                tableOutput("fit"),
                br(),
                h5('This Shiny Application was created for the \"Developing Data Products\" Coursera Class.'),
                h5('It takes the user selected input variables, plots them neatly, and then performs linear regression'),
                h5('It also adds the regression line to the plot.'),
                h5('Enjoy!!')
                )
)))