#create histograms and cdfs from column data

# Mise en place
rm(list = ls())

#set working directory
setwd("E:/plotting-examples/histogram_and_cdf")

#read data 
M=read.table("../example_data/column_data.txt",sep=" ",header=FALSE)

#Create Plots
windows(9,6)
plot.new()
#create 2 rows of 3 plots
par(mfrow=c(2,3), mar=c(6,4,4,2))

#Row of histograms
for (i in 2:4){
  par(xaxs="i", yaxs="i") 
  hist(M[,i],xlab ="Values",ylab="Frequency", main = paste("Column ",i),
       col = "darkgrey")
  
}

#Row of CDFs
for (i in 2:4){
  column.ordered <- sort(M[ ,i])
  n = length(column.ordered)
  plot(column.ordered, (1:n)/n, type = 's', ylim=c(0,1), xlim = range(column.ordered),
       xlab = "Values", ylab = "CDF", xaxs="i",yaxs="i")
  
}

