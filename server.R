library(shiny)
library(tidyr)
library(datasets)

shinyServer(function(input, output) {
  titan <- data.frame(Titanic)
  tidyTitan <- spread(titan, Survived, Freq)
  colnames(tidyTitan)[4] <- "Died"
  colnames(tidyTitan)[5] <- "Survived"
  tidyTitan$Total <- tidyTitan$Died + tidyTitan$Survived
  tidyTitan$pSurv <- tidyTitan$Survived / tidyTitan$Total

  output$Total <- renderText({
    sum(tidyTitan$Total)
  })
  
  output$Subset <- renderText({
    tidyTitan[tidyTitan$Class == input$Class & tidyTitan$Sex == input$Sex & tidyTitan$Age == input$Age, "Total"]
  })
     
  output$Prob <- renderText({
       if (input$Class == "Crew" & input$Age == "Child") {
           "There were no children in the crew!"
       }
       else {
         tidyTitan[tidyTitan$Class == input$Class & tidyTitan$Sex == input$Sex & tidyTitan$Age == input$Age, "pSurv"]
       }
         })
})