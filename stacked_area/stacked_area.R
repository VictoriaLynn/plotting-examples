#create a stacked area plot from column data

# Mise en place
rm(list = ls())


#Installing and loading required packages
if (!require("plotrix")) {
  install.packages("plotrix", dependencies = TRUE)
  library(animation)
}

#set working directory (necessary if not using Rstudio)
#setwd("C:/Users/Tori/My\ Documents/plotting-examples/line_plot")

#read data 
M=read.table("../example_data/column_data.txt",sep=" ",header=FALSE)


x <- cbind(M[ ,1],M[ ,1], M[ ,1])
y <- cbind(M[ ,2],M[ ,3],M[ ,4])

#plotting margins.  
par(mar = c(5,5,2,2), font = 1.5)

stackpoly(x,y,main="Stacked area plot of column data",xlab="X",
          ylab="Sum of y values", xat=seq(1,10), stack = TRUE, 
          col = c("black","red", "darkgray"), border=c("black"), 
          lty = c(1,1,1), lwd=c(1.5), axis4 = FALSE)

#add a legend
legend(7.7,0.4, c("Series 1","Series 2","Series 3"), 
       fill=c("black","red","darkgray"),border=c("black")) 
