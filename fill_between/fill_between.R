#create line plot from column data

# Mise en place
rm(list = ls())

#read data 
M=read.table("../example_data/column_data.txt",sep=" ",header=FALSE)

#plotting margins.  
par(mar = c(5,5,2,2), font = 1.5)

plot(M[ ,1],M[ ,2],type = 'n', xlim=c(0.3,9.7),
     ylab = 'Y', xlab = 'X',main='Line Plot of Column Data')
lines(M[ ,1], M[ ,3], col = 'red', lwd=c(2), lty=c(2))
lines(M[ ,1], M[ ,2], col = 'black', lwd=c(2), lty=c(1))

#fill between
polygon(c(M[ ,1], rev(M[ ,1])), c(M[ ,3], rev(M[ ,2])),
        col = "lightgray", border = NA)

grid(col = "lightgray", lty = "dotted",
     lwd = c(2))


#add a legend
legend(6.5,0.25, c("Series 1","Series 2"), lty=c(1,2),
       lwd=c(2,2),col=c("black","red")) 
