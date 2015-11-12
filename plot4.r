
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
png(file="plot4.png",width=480,height=480)

par(mfrow = c(2, 2))

#make the plot 1
plot(PowerConsumption$DateTime,
     PowerConsumption$Global_active_power,
     type="o",
     pch="",
     main="",xlab="",
     ylab ="Global Active Power (kilowatts)")

#make the plot 2
plot(PowerConsumption$DateTime,
     PowerConsumption$Voltage,
     type="o",
     pch="",
     main="",
     xlab="datetime",
     ylab ="Voltage")

#make the plot 3
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
                colnames(PowerConsumption[9])),
       box.col ="transparent"       
)

#make the plot 4
plot(PowerConsumption$DateTime,
     PowerConsumption$Global_reactive_power,
     type="o",
     pch="",
     main="",
     xlab="datetime",
     ylab ="Global_reactive_power")

#Close PNG
dev.off ()