source("getting_and_clear.R")




#new column date-time
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
png(file="plot2.png",width=480,height=480)

#make the plot
plot(PowerConsumption$DateTime,
     PowerConsumption$Global_active_power,
     type="o",
     pch="",
     main="",xlab="",
     ylab ="Global Active Power (kilowatts)")

#close PNG
dev.off ()