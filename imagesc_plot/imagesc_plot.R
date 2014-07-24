# create R version of Matlab's imagesc plot
# of gridded 2D data

# Mise en place
rm(list = ls())
graphics.off()

#Installing and loading required packages
if (!require("fields")) {
  install.packages("fields", dependencies = TRUE)
  library(animation)
}

#- Open a plotting device
#pdf("imagesc_plot.pdf", width=7, height=5)

#set working directory (necessary if not using Rstudio)
#setwd("E:/plotting-examples/imagesc_plot")

#read data 
M<- as.matrix(read.table("../example_data/gridded_2D.txt",sep=" ",header=FALSE))

x <- seq(0, 1, by=0.01)
y <- seq(0,1, by=0.01)

#plotting margins.  
par(mar = c(5,5,2,2), font = 1.5)

#make the image plot
image.plot(x,y,M, main="Imagesc Plot of Gridded 2D Data",xlab="X",ylab="Y",
           legend.lab ="Z",col=heat.colors(40), zlim=range(M),
           xlim=c(0,1), ylim=c(0,1), xaxs="i", yaxs="i")