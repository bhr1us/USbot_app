# ui.R

shinyUI(fluidPage(
  titlePanel("US Botulism Cases"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create a plot for different botulism types in a given year."),
      
      sliderInput("year", 
                  label = "Select a year:", sep = "",
                  min = 2000, max = 2012, value = 2000)
    ),
    
    
    mainPanel(
      tableOutput("table"),
      strong("Total No. of Cases:",
        textOutput("text")),
      plotOutput("plot")
      )
  )
))
