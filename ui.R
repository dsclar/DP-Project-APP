library(shiny)

shinyUI(fluidPage(
    headerPanel("Depressed or not depressed ? That is the question!"),
    sidebarLayout(
        sidebarPanel(
            helpText("This short questionnaire will help us to detect the best predictors of depression."),
            p("Please enter 1 for YES, 0 for NO for the following statements below:"),
            numericInput('input1', 'I was happy', 1, min = 0, max = 1, step = 1),
            radioButtons("radio1", label = h5("Please enter how long you felt that way during the past week:"),
                         choices = list("Less than 1 day" = -3, "1 to 2 days" = -2, "3 to 4 days" = -1, "5 to 7 days" = 0), 
                         selected = -3),
            
#             hr(),
#             fluidRow(column(3, verbatimTextOutput("value1"))),
            
            numericInput('input2', 'I had trouble keeping my mind on what I was
doing', 1, min = 0, max = 1, step = 1),
            radioButtons("radio2", label = h5("Please enter how long you felt that way during the past week:"),
                        choices = list("Less than 1 day" = 0, "1 to 2 days" = 1, "3 to 4 days" = 2, "5 to 7 days" = 3), 
                        selected = 0),
            numericInput('input3', 'I had crying spells', 1, min = 0, max = 1, step = 1),
            radioButtons("radio3", label = h5("Please enter how long you felt that way during the past week:"),
             choices = list("Less than 1 day" = 0, "1 to 2 days" = 1, "3 to 4 days" = 2, "5 to 7 days" = 3), 
             selected = 0),
            numericInput('input4', 'I did not feel like eating; my appetite was
poor', 1, min = 0, max = 1, step = 1),
            radioButtons("radio4", label = h5("Please enter how long you felt that way during the past week:"),
             choices = list("Less than 1 day" = 0, "1 to 2 days" = 1, "3 to 4 days" = 2, "5 to 7 days" = 3), 
             selected = 0),
            numericInput('input5', 'I felt fearful', 1, min = 0, max = 1, step = 1),
            radioButtons("radio5", label = h5("Please enter how long you felt that way during the past week:"),
             choices = list("Less than 1 day" = 0, "1 to 2 days" = 1, "3 to 4 days" = 2, "5 to 7 days" = 3), 
             selected = 0),
            h3("Have you been diagnosed as clinically depressed within the last 12 months?"),
            numericInput('cd1', 'diagnosed as depressed', 0, min = 0, max = 1, step = 1),
            dateInput("date", "Date:"),
            actionButton("goButton", "Go!")
            
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Application", verbatimTextOutput("Application")),
            tabPanel("Documentation", verbatimTextOutput("Documentation"))
        ),
        h3("You entered:"),
        fluidRow(
            column(3, h4("I am happy"), verbatimTextOutput("oid1")),
            column(3, h4("How long:"), verbatimTextOutput("rd1"))),
        fluidRow(
            column(3, h4("Problem focusing"), verbatimTextOutput("oid2")),
            column(3, h4("How long:"), verbatimTextOutput("rd2"))),
        fluidRow(
            column(3, h4("Crying"), verbatimTextOutput("oid3")),
            column(3, h4("How long:"), verbatimTextOutput("rd3"))),
        fluidRow(
            column(3, h4("Appetite"), verbatimTextOutput("oid4")),
            column(3, h4("How long:"), verbatimTextOutput("rd4"))),
        fluidRow(
            column(3, h4("Fear"), verbatimTextOutput("oid5")),
            column(3, h4("How long:"), verbatimTextOutput("rd5"))),
       
        fluidRow(
            column(3, h4("today's date:"), verbatimTextOutput("odate")),
            column(3, h4("Your total score is:"), verbatimTextOutput("prediction")),
            column(3, h4("Diagnosed as depressed"), verbatimTextOutput("oid6"))),
        h4("As of today, this score suggests :"),
        textOutput('text'),
        strong(textOutput('text3'))
            )
)))