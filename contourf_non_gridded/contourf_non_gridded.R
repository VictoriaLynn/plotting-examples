#Create contourf plot from non-gridded(experimental) data
# Mise en place
rm(list = ls())
graphics.off()

#Installing and loading required packages
#fields is useful for colorbars and image plots
if (!require("fields")) {
  install.packages("fields", dependencies = TRUE)
  library(animation)
}

#use akima for interpolation
if(!require("akima")) {
  install.packages("akima", dependencies = TRUE)
  library(akima)
}
#set working directory (necessary if not using Rstudio)
#setwd("E:/plotting-examples/contour_surf")

#read.table(filename,sep="delimiter",header=FALSE)
M<- as.matrix(read.table("../example_data/non_gridded_2D.txt",sep=" ",header=FALSE))

#M contains rows of (x,y,z) points that are not on a regular grid
x <- M[ ,1]
y <- M[ ,2]
z <- M[ ,3]

# define a regular grid to interpolate the experimental data
# (in this case, x and y were generated randomly on the interval [0, 10])
steps <- seq(0,10,by=0.1)
XI <- steps
YI <- steps
ZI = interp(x,y,z,XI,YI)
# Plot interpolation
#Keep in mind that the values are interpolated, so the smooth contours
#may be deceiving compared to the underlying data
#Note that colors do not extend to the edge of the plot because
#no data occurs in these bins

image.plot(XI,YI,ZI$z, col = heat.colors(20), 
           main = "Interpolated Contour Plot of NonGridded Data",
           xlab = "X", ylab = "Y", legend.lab="Z",xlim=range(XI),
           ylim = range(YI))

