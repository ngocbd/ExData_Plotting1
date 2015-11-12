source("getting_and_clear.R")


PowerConsumption$DateTime <- 
  as.POSIXct(paste(PowerConsumption$Date, 
                   PowerConsumption$Time), 
             format="%d/%m/%Y %H:%M:%S")

#convert Date into date
PowerConsumption$Date <- 
  strptime(PowerConsumption$Date,"%d/%m/%Y")

#convert time into time
PowerConsumption$Time <- 
  strptime(PowerConsumption$Time, "%H:%M:%S")

#open png
png(file="plot3.png",width=480,height=480)

#make the plots
plot(PowerConsumption[,c(10,7)],type="l",pch="",col="black", 
     ylab ="Energy sub metering",xlab="")
lines(PowerConsumption[,c(10,8)], type="l", pch="", col="red")
lines(PowerConsumption[,c(10,9)], type="l", pch="", col="blue")
legend("topright",
       lty=c(1,1,1),
       col=c("black", "red", "blue"),
       #text.col=c("black", "red", "blue"),
       legend=c(colnames(PowerConsumption[7]),
                colnames(PowerConsumption[8]),
                colnames(PowerConsumption[9]))
)
#close PNG
dev.off ()