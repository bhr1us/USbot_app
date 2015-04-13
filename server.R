# server.R

states <- read.csv("data/Botulism_cases.csv")

shinyServer(
  function(input, output) {
  
    output$plot <- renderPlot({    
      year.df <- subset(states, states$Year==input$year)    
      FB<- nrow(subset(year.df, year.df$BotulismType=="foodborne"))
      IB<- nrow(subset(year.df, year.df$BotulismType=="Infant"))
      WB<- nrow(subset(year.df, year.df$BotulismType=="Wound"))
      UN<- nrow(subset(year.df, year.df$BotulismType=="Other"))
      types <- c("Foodborne", "Infant", "Wound", "Other")
      cases <- c(FB, IB, WB, UN)
      barplot(cases, names.arg=types, xlab = "Botulism Type", ylim = range(0:120), ylab = "# Cases", main = c("US Botulism Cases: ", input$year), 
            col = "skyblue")

    })
    output$table<- renderTable({
      year.df <- subset(states, states$Year==input$year)    
      FB<- nrow(subset(year.df, year.df$BotulismType=="foodborne"))
      IB<- nrow(subset(year.df, year.df$BotulismType=="Infant"))
      WB<- nrow(subset(year.df, year.df$BotulismType=="Wound"))
      UN<- nrow(subset(year.df, year.df$BotulismType=="Other"))
      types <- c("Foodborne", "Infant", "Wound", "Other")
      cases <- c(FB, IB, WB, UN)
      tab<- cbind(types, cases)
      tab
    })
    
    output$text <- renderText({ 
      year.df <- subset(states, states$Year==input$year)    
      FB<- nrow(subset(year.df, year.df$BotulismType=="foodborne"))
      IB<- nrow(subset(year.df, year.df$BotulismType=="Infant"))
      WB<- nrow(subset(year.df, year.df$BotulismType=="Wound"))
      UN<- nrow(subset(year.df, year.df$BotulismType=="Other"))
      cases <- c(FB, IB, WB, UN)
      sum(cases)
    })
  }
)