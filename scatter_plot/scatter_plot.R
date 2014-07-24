#Create scatter plot from non-gridded 2D data
#some of this code originally by Greg Garner
# Mise en place
rm(list = ls())
graphics.off()

#set working directory
setwd("E:/plotting-examples/scatter_plot")

#read.table(filename,sep="delimiter",header=FALSE)
M=as.matrix(read.table("../example_data/non_gridded_2D.txt",sep=" ",header=FALSE))
x <- M[ ,1]
y <- M[ ,2]
z <- M[ ,3]

#- Here's a useful function to normalize a vector of data
#- to between 0 and 1.
normalize.vector <- function(x, ...) {
  (x-min(x, ...))/max(x-min(x, ...), ...)
}

#fields is useful for colorbars
if (!require("fields")) {
  install.packages("fields", dependencies = TRUE)
  library(fields)
}

#plotting margins.  
par(mar = c(5,5,2.5,8.5), font = 2, xaxs = "i",yaxs = "i")

#Make the scatter plot
#- Making a colorbar is a multi-step process.  First
#- let's create a color ramp from which to sample colors
my.colramp <- colorRamp(colors=c("blue", "lightblue", 
                                 "lightgreen", "yellow", 
                                 "orange", "red", "darkred"))

#- "my.colramp" is a function that takes a value [0,1] and
#- returns an rgb value for the appropriate color in the ramp.

#- Normalize the data of the z column
z.norm <- normalize.vector(z, na.rm=T)

#- Use the normalized values to get colors
z.col.components <- my.colramp(z.norm)

#- Convert the rgb values into actual colors
z.cols <- rgb(z.col.components, maxColorValue=255)

#- Use the same color ramp to make colors for the bar
my.colbar.cols <- rgb(my.colramp(seq(0,1,l=100)), maxColorValue=255)


plot(M[ ,1],M[ ,2],main="Scatter Plot of Non-Gridded 2D Data",
                     xlab='X',ylab='Y', pch=19, col=z.cols, 
                     xlim = range(x),ylim=range(y),
                     panel.first=grid(lty= "dashed"))

# Add a colorbar

#- For the colorbar, "fields" is a fairly useful package.
#- It provides "image.plot" which will allow you to plot
#- a colorbar over an existing plot.
image.plot(legend.only=T, add=T, horizontal=F, 
           col=my.colbar.cols, zlim=range(z),
           legend.lab="Z", legend.line=1.5)
