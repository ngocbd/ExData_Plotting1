source("getting_and_clear.R")


#convert Date into date
PowerConsumption$Date <- 
  strptime(PowerConsumption$Date,"%d/%m/%Y")

#convert time into time
PowerConsumption$Time <- 
  strptime(PowerConsumption$Time, "%H:%M:%S")

#open png
png(file="plot1.png",width=480,height=480)

#make the plot
hist(PowerConsumption$Global_active_power,
     col ="red",main="Global Active Power",
     xaxp = c(0, 6, 3),yaxp = c(0, 1200, 6),
     xlab="Global Active Power (kilowatts)")

#close device
dev.off ()