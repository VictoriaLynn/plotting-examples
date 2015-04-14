# Scatter_3D.R
# Tori Ward
# vlw27@cornell.edu, Cornell
# July, 2014

#refined by Greg Garner
#- (ggg121@psu.edu)
#- 14 July 2014

# R code for plotting 3-D scatter plots
# Mise en place
rm(list = ls())
graphics.off()

#set working directory
setwd("C:/Users/Tori/My Documents/plotting-examples/3D-scatter")

#- Open a plotting device
pdf("scatter3d_plot.pdf", width=7, height=5)


#- Here's a useful function to normalize a vector of data
#- to between 0 and 1.
normalize.vector <- function(x, ...) {
  (x-min(x, ...))/max(x-min(x, ...), ...)
}


if (!require("scatterplot3d")) {
  install.packages("scatterplot3d", dependencies = TRUE)
  library(scatterplot3d)
}

if (!require("fields")) {
  install.packages("fields", dependencies = TRUE)
  library(fields)
}


#- There are much easier and faster ways to 
#- read in data files.  Consider this...
my.rawdata <- read.table("../example_data/five_obj_data.txt", header=F, colClasses="numeric")
nobjs <- ncol(my.rawdata)
npoints <- nrow(my.rawdata)
obj1 <- my.rawdata[,1]
obj2 <- my.rawdata[,2]
obj3 <- my.rawdata[,3]
obj4 <- my.rawdata[,4]
obj5 <- my.rawdata[,5]

#- "my.rawdata" is now represented in R as it is in the
#- original file (rows = points, cols = objectives).

#- Making a colorbar is a multi-step process.  First
#- let's create a color ramp from which to sample colors
my.colramp <- colorRamp(colors=c("blue", "lightblue", 
                                 "lightgreen", "yellow", 
                                 "orange", "red", "darkred"))

#- "my.colramp" is a function that takes a value [0,1] and
#- returns an rgb value for the appropriate color in the ramp.

#- Normalize the data of the fourth objective
obj.norm <- normalize.vector(obj4, na.rm=T)

#- Use the normalized values to get colors
obj.col.components <- my.colramp(obj.norm)

#- Convert the rgb values into actual colors
obj.cols <- rgb(obj.col.components, maxColorValue=255)

#- Use the same color ramp to make colors for the bar
my.colbar.cols <- rgb(my.colramp(seq(0,1,l=100)), maxColorValue=255)


#Make the scatter plot
size_scale <- normalize.vector(-obj5, na.rm=T)
size_scale <- size_scale*1.5
size_scale[size_scale < 0.05] = 0.05

sd3d = scatterplot3d(obj1,obj2,obj3,main="Scatter Plot of Non-Gridded 3D Data",
                     xlab='Obj1',ylab='Obj2',zlab='Obj3', pch=19, cex.symbols=size_scale, color=obj.cols, 
                     xlim = range(obj1),ylim=range(obj2),zlim=rev(range(obj3)),
                     mar=c(4,3,2,8.5)+0.1, y.margin.add=0.1)

#- "for" loops in R are incredibly inefficient.
#- Consider using the "apply" family of functions.
#- I've included these points in the original 
#- "scatterplot3d" call, so this is just for reference.
#- This code will do exactly what the for-loop does, only
#- it's more R-friendly.

#invisible(sapply(1:npoints, function(x) {
#  sd3d$points3d(obj1[x], obj2[x], obj3[x], 
#                pch=19, cex=size_scale[x], col=obj.cols[x])
#}))

# Loop to plot each point in color
#for(i in 1:length(obj1)){ 
#  sd3d$points3d(obj1[i], obj2[i],obj3[i],pch=19,cex=size_scale[i], col=ColorRamp[color_scl[i]])
#}


#Plot ideal point 
sd3d$points3d(0.05,-0.4,-0.04,pch="*", col= "dark blue", bg="dark blue",cex=3)

# Add a colorbar

#- For the colorbar, "fields" is a fairly useful package.
#- It provides "image.plot" which will allow you to plot
#- a colorbar over an existing plot.
image.plot(legend.only=T, add=T, horizontal=F, 
           col=my.colbar.cols, zlim=range(obj4),
           legend.lab="My Colorbar", legend.line=-2.5)

### End of Plotting
dev.off()


