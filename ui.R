library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict Survival on the Titanic"), 
  sidebarLayout(
    sidebarPanel(
      selectInput("Class", "Class", c("1st" = "1st", "2nd" = "2nd", "3rd" = "3rd", "Crew" = "Crew")),
      selectInput("Sex", "Sex", c("Male" = "Male", "Female" = "Female")),
      selectInput("Age", "Age", c("Child" = "Child", "Adult" = "Adult"))                        
      ), 
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Titanic App", br(), 
        h3("Total Number of passengers"),
        textOutput("Total"),
        h3("Number of selected passengers"),
        textOutput("Subset"),
        h3("Probability of survival"),
         textOutput("Prob") ),
        tabPanel("Help", br(), h5("This is a very simple app which 
                                          outputs the probability of survival 
                                          based on the personal parameters of 
                                          the passengers on the Titanic. 
                                          To use this app, simply use the three 
                                          drop down menus to select the type of 
                                          passenger you are interested in. You 
                                          will then see the total number of those 
                                          passengers and the probability they 
                                          survived. It really couldn't be simpler!"))
         ))
    )
  ))

