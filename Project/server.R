shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    # Initializing the population with # of zombies and # of healthy individuals
    
    x <- c(rep("Zombie", input$pop*input$prob), rep("Healthy", input$pop*(1-input$prob)))
    prop_zombies <- NULL
    prop_zombies[1] <- input$prob
    prop_healthy <- NULL
    prop_healthy[1] <- 1
    population <- input$pop
    days <- 1
    fates <- runif(input$pop)
    while(sum(x=="Healthy")!=0 & sum(x=="Zombie")!=0) {
      
    unif <- runif(length(x))  
      for(i in 1:length(x)) {
        if(fates[i] < prop_zombies[days]) {
          if ((unif[i] < input$probdeath) & x[i]!="Dead" & x[i]!="Zombie") {x[i] <- "Dead"
                                                                       population<-population-1
                                                                       
          } else if(x[i]!="Dead") {x[i] <- "Zombie"  
          }
        }
      }
      days=days+1 
      prop_zombies[days] <- sum(x=="Zombie")/input$pop
      prop_healthy[days] <- sum(x!="Dead" & x!="Zombie")/input$pop
      fates <- runif(input$pop)
    }
    qplot(main="Daily Population Stats", xlab="Day", ylab="Proportion")+
    geom_line(aes(x=1:length(prop_zombies), y=prop_zombies, color="red")) +
    geom_point(aes(x=1:length(prop_zombies), y=prop_zombies, color="red")) +
    geom_line(aes(x = 1:length(prop_healthy), y = prop_healthy, color = "blue")) +
    geom_point(aes(x = 1:length(prop_healthy), y = prop_healthy, color = "blue")) +
      scale_colour_discrete(name  ="Population",
                            breaks=c("blue", "red"),
                            labels=c("Human", "Zombie")) 
    
  })
})