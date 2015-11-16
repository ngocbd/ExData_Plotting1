setwd("c:/users/Ngocbd/ExData_Plotting1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- "household_power_consumption.txt"
if (!file.exists(f))
{
  download.file(url, f)
  unzip ("household_power_consumption.zip", exdir = ".")
}

data <- data[(Date == "1/2/2007" | Date == "2/2/2007"), ]
data$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
rownames(data) <- 1 : nrow(data)
data <- cbind(data[, 10], data[, 3:9])
colname <- colnames(data)
colname[1] <- "Date_time"
colnames(data) <- colname
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12, ylim = c(0, 1200))
dev.off()
rm(data)