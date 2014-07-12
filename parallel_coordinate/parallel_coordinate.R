###
#R template for parallel_coordinate plots emulating Jon and Matt's
# Matlab and python scripts
#Victoria Ward
# July 2014
#
# Mise en place
rm(list = ls())

#load package for parallel coordinate plot
library(MASS)

#read data 
M=read.table("../example_data/column_data.txt",sep=" ",header=FALSE)


# define "brushing" thresholds
# useful to focus on a few solutions instead of all at once
# thresholds row format: column number, threshold value, less than (-1) or greater than (1)
# not all columns need to have thresholds applied

thresholds <- matrix(c(2,0.2,1, 4,0.5,-1), nrow = 2, ncol = 3, byrow = TRUE)

#determine solutions to be brushed
IX <- seq(1,dim(M)[1])


for (i in 1:nrow(thresholds))
{
  col <- thresholds[i ,1]
  if(thresholds[i,3]==-1){
    tempIX <- rfind <- seq(along=M[ ,col])[as.logical(M[ ,col] < thresholds[i,2])]
  }
  else{
    tempIX <- rfind<- seq(along=M[ ,col])[as.logical(M[ ,col] > thresholds[i,2])]
  }
  
  IX <- intersect(IX,tempIX)
    
}

brush_on_idx <- unique(IX)
brush_off_idx <- setdiff(seq(1,nrow(M)),brush_on_idx)


#re-map the values in M to [0, 1] for consistent plotting
ncols = ncol(M)
for (i in 1:ncols){
M[ ,i] <- (M[ ,i] - min(M[ ,i], na.rm=T))/(max(M[ ,i], na.rm=T) - min(M[ ,i], na.rm=T))
}

# brush_on_idx now contains the indices of the rows of M that satisfy:
# Column 2 greater than 0.2 (scaled value)
# Column 4 less than 0.5 (scaled value)
# brush_off_idx contains the remaining indices that do not satisfy these.


#make color_map.  This one scales based on column 1 values
col_to_plot <- M[brush_on_idx,1]

ColorRamp <- c(colorRampPalette(c("blue", "light blue"))(50),
               colorRampPalette(c("light blue", "light green", "yellow"))(55),
               colorRampPalette(c("orange", "red", "darkred"))(70))
ColorLevels <- seq(min(col_to_plot), max(col_to_plot), length=length(ColorRamp))

z_scl <- (col_to_plot - min(col_to_plot, na.rm=T))/
  (max(col_to_plot, na.rm=T) - min(col_to_plot, na.rm=T))
color_scl = round(z_scl*length(ColorRamp))
color_scl[color_scl == 0] = 1

#concatenate brushed off and brushed on indices in a matrix for plotting
all_solutions =rbind(M[brush_off_idx, ],M[brush_on_idx, ]) 

colnames(all_solutions) <- c("Column 1", "Column 2", "Column 3", "Column 4")

# Set layout to include a colorbar next to plot.
layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(4,1),
       heights=c(1,1))
#plotting margins.  
par(mar = c(5,5,2.5,1), font = 1.5)

#plot solutions
parcoord(all_solutions, 
         col=c(rep.int("grey",length(brush_off_idx)),ColorRamp[color_scl]), 
         var.label=FALSE, main='Parallel Coordinate Plot of Column Data',
         xaxt = "n")

mtext("Scaled Values", side = 2, line = 1, cex = par("cex.lab"))
# Add a colorbar
par(mar = c(5,2.75,2.5,2.75))

image(1, ColorLevels,
      matrix(data=ColorLevels, ncol=length(ColorRamp),nrow=1),
      col=ColorRamp,xlab="",ylab="Column 1 Value",xaxt="n", las = 1)
mtext("Column 1 Value", side = 4, line = 0.5, cex.lab = 0.5)

### End of Plotting
