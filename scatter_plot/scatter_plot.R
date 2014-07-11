#Create scatter plot from non-gridded 2D data
#some of this code created with help from 
#http://chitchatr.wordpress.com/page/3/

#read.table(filename,sep="delimiter",header=FALSE)
M=read.table("../example_data/non_gridded_2D.txt",sep=" ",header=FALSE)
str(M)

# Set layout.  We are going to include a colorbar next to plot.
layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(4,1),
       heights=c(1,1))
#plotting margins.  
par(mar = c(5,5,2.5,1), font = 2)

#Make the scatter plot

plot(M$V1,M$V2,main="Scatter Plot of Non-Gridded 2D Data",
     xlab='X',ylab='Y')
par(mar = c(5,5,2.5,1), font = 2)
ColorRamp <- c(colorRampPalette(c("blue", "light blue"))(50),
             colorRampPalette(c("light blue", "light green", "yellow"))(55),
             colorRampPalette(c("orange", "red", "darkred"))(70))
ColorLevels <- seq(min(M$V3), max(M$V3), length=length(ColorRamp))

z_scl <- (M$V3 - min(M$V3, na.rm=T))/(max(M$V3, na.rm=T) - min(M$V3, na.rm=T))
color_scl = round(z_scl*length(ColorRamp))
color_scl[color_scl == 0] = 1

# Loop to plot each point
for(i in 1:length(M$V1)){ 
  points(M$V1[i], M$V2[i], pch = 20, col = ColorRamp[color_scl[i]], cex = 2.5)
}

# Add a colorbar
par(mar = c(4,3.5,3.5,3))

image(1, ColorLevels,
      matrix(data=ColorLevels, ncol=length(ColorRamp),nrow=1),
      col=ColorRamp,xlab="",ylab="",xaxt="n", las = 1)

### End of Plotting