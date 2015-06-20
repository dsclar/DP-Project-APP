library(shiny)

#     depressionRisk <- function(prediction) prediction=(input$input1*as.numeric(input$radio1))
# +(input$input2*as.numeric(input$radio2))
# +(input$input3*as.numeric(input$radio3))
# +(input$input4*as.numeric(input$radio4))
# +(input$input5*as.numeric(input$radio5))
    #depressionRisk <- function(score) score=(input$input1+input$input2+input$input3+input$input4+input$input5)
shinyServer(
    function(input, output) { 
        output$oid1 <- renderPrint({input$input1})
        output$rd1 <- renderPrint({input$radio1})
        output$oid2 <- renderPrint({input$input2})
        output$rd2 <- renderPrint({input$radio2})
        output$oid3 <- renderPrint({input$input3})
        output$rd3 <- renderPrint({input$radio3})
        output$oid4 <- renderPrint({input$input4})
        output$rd4 <- renderPrint({input$radio4})
        output$oid5 <- renderPrint({input$input5})
        output$rd5 <- renderPrint({input$radio5})
        output$oid6 <- renderPrint({input$cd1})
        output$odate <- renderPrint({input$date})
        output$text3 <- renderText({
            if (input$goButton == 0) "You have not pressed the button"
            else if (input$goButton == 1) "You pressed it once"
            else "OK quit pressing it"
        })
            # output$prediction <- renderPrint({depressionRisk(input$prediction)})
        output$prediction <- renderPrint({((input$input1*as.numeric(input$radio1))
                                           +(input$input2*as.numeric(input$radio2))
                                           +(input$input3*as.numeric(input$radio3))
                                           +(input$input4*as.numeric(input$radio4))
                                           +(input$input5*as.numeric(input$radio5)))})
        output$text <- renderText({
            ifelse(('prediction'< 5), "You are not depressed", "You are likely to be depressed")
        })
        output$Documentation <- renderText("The score you obtained today is the sum of the multiplications of each input (1 or 0) with the number of days experiencing the feeling. 
Along with your report of being clinically diagnosed or not, it will be recorded in an encrypted database without any personal identifier. 
Both outcomes will be compared. If there no convergence, a new prediction will be performed, and so on until a satisfactory accuracy is achieved. 
The goal of this application is to collect data with the ultimate purpose to refine how depression can be detected using an optimal number of questions that would yield 
the optimal sensitivity and specificity.")
 
    }
)