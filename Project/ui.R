library(ggplot2)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("ZOMBIE APOCALYPSE!!!"),
  
  # 0 for dead, 1 for zombie, 2 for healthy
  sidebarLayout(
    sidebarPanel(
      numericInput("prob", "Probability of Zombie Bite", 0.1),
      numericInput("probdeath", "Probability of Death from Zombie Bite", 0.5),
      numericInput("pop", "Population Size", 100)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))