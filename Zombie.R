pop <- 100
prob <- 0.1

x    <- c(rep("Zombie", pop*prob), rep("Healthy", pop*(1-prob)))
prop_zombies <- NULL
prop_zombies[1] <- prob
prop_healthy <- NULL
prop_healthy[1] <- 1
population <- pop
days <- 1
fates <- runif(pop)
probdeath <- 0.5
while(sum(x=="Healthy")!=0 & sum(x=="Zombie")!=0) {
  
  
  for(i in 1:length(x)) {
    if(fates[i] < prop_zombies[days]) {
      if ((runif(1) < probdeath) & x[i]!="Dead" & x[i]!="Zombie") {x[i] <- "Dead"
                                        population<-population-1
                                        
      } else if(x[i]!="Dead") {x[i] <- "Zombie"  
      }
    }
  }
  days=days+1 
  prop_zombies[days] <- sum(x=="Zombie")/population
  prop_healthy[days] <- sum(x!="Dead" & x!="Zombie")/pop
  fates <- runif(pop)
}