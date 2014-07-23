# Create contour and surface plots of gridded 2D data

# Mise en place
rm(list = ls())
graphics.off()

#Installing and loading required packages

#fields is useful for colorbars
if (!require("fields")) {
  install.packages("fields", dependencies = TRUE)
  library(animation)
}

#used lattice for surface plot
if (!require("lattice")) {
  install.packages("lattice", dependencies = TRUE)
  library(lattice)
}

#set working directory (necessary if not using Rstudio)
#setwd("E:/plotting-examples/contour_surf")

#source any required functions
source("./Filled.contour3.R")

#read data 
M<- as.matrix(read.table("../example_data/gridded_2D.txt",sep=" ",header=FALSE))

x <- seq(0, 1, by=0.01)
y <- seq(0,1, by=0.01)


#Create Plots
windows(9,3)
plot.new()
#create a row of 3 plots
par(mfrow=c(1,3), mar=c(3,3,4,6))

#create contour plot
contour(x,y,M,col=heat.colors(10),xlab="X",ylab="Y",
        main="Contour Plot of Gridded 2D Data",
        xlim=range(x, finite=TRUE),ylim=range(y, finite=TRUE),
        drawlabels=FALSE, yaxs="i", xaxs = "i",
        zlim = c(0,1))

#add colorbar to contour plot
image.plot(legend.only=T, add=T, horizontal=F, 
           col=heat.colors(10), zlim=c(0,1),
           legend.lab="Z", legend.line=1.5, zaxs = "i")

#Create filled contour plot 
#par(new = "TRUE",plt = c(0.6,0.8,0.60,0.95),las = 1,cex.axis = 1)
filled.contour3(x,y,M,color = heat.colors, xlab="X",
                ylab = "Y", xlim =c(min(x),max(x)), ylim = c(min(y),max(y)),
                zlim=c(min(M),max(M)), main="Filled Contour Plot of Gridded 2D Data")
#add colorbar to filled contour plot
image.plot(legend.only = T, add = T, horizonatal = F, col=heat.colors(10),
           zlim = c(0,1),legend.lab = "Z", legend.line = 1.5, zaxs = "i")

#create a surface plot
surf.colors <- function(x, col = heat.colors(40)) {
  
  # First we drop the 'borders' and average the facet corners
  # we need (nx - 1)(ny - 1) facet colours!
  x.avg <- (x[-1, -1] + x[-1, -(ncol(x) - 1)] +
              x[-(nrow(x) -1), -1] + x[-(nrow(x) -1), -(ncol(x) - 1)]) / 4
  
  # Now we construct the actual colours matrix
  colors = col[cut(x.avg, breaks = length(col), include.lowest = T)]
  
  return(colors)
}


persp(x,y,M, theta=45, phi = 30, 
      col=surf.colors(M), shade = 0.4, ltheta=120, border = NA, ticktype = 'detailed',
      zlab = '', main = "Surface Plot of Gridded 2D Data")


