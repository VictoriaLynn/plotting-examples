#create animated gif of a sine wave

# Mise en place
rm(list = ls())


#set working directory (necessary if not using RStudio)
setwd("E:/plotting-examples/animated_gif")

x <- seq(0,2*pi,by=0.01)
omega <- 0.5
k = 1 

#check for existence of frames subdirectory and create if it doesn't exist
#also clears all existing files from that directory
if (file.exists("./frames")){
  do.call(file.remove,list(list.files("./frames",full.names=TRUE)))
} else {
  dir.create(file.path("E:/plotting-examples/animated_gif/frames"))
  
}

#remove previous .gif if it exists
if (file.exists("./sinewave.gif")){
  file.remove("./sinewave.gif")
}

#create images that will go into animated gif
png(file="frames/frame%02d.png", width=400, height=400)
for (t in 1:50){

#plotting margins.  
par(mar = c(2,2,2,2), font = 1.5)

matplot(x,sin(omega*t+k*x),type="l",xlab="",ylab="",main="",
        col=c("red"), lwd=c(2), lty=c(1), ylim=c(-1,1),
        xlim=range(x),yaxs="i",xaxs="i")

#add grid
abline(v=(seq(0,6, 1)), col="lightgray", lty="dotted")
abline(h=(seq(-1,1,0.5)), col="lightgray", lty="dotted")
}
dev.off()

#need imagemagick for this last part.  This was done on Windows.
#I received some warnings, but it worked!  Another option is to comment
#out this command and type "convert -delay 10 -loop 0 frames/*.png
#sinewave.gif into a command line.  
system('"C:\\Program Files (x86)\\ImageMagick-6.8.9-Q16\\convert.exe" 
       -delay 10 -loop 0 frames/*.png sinewave.gif')
