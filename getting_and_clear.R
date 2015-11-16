setwd("c:/users/Ngocbd/ExData_Plotting1")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- "household_power_consumption.txt"

if (!file.exists(f))
{
  download.file(url, "household_power_consumption.zip")
  unzip ("household_power_consumption.zip", exdir = ".")
}
data <- 
  read.csv("household_power_consumption.txt",
           sep =";", na.strings = "?",header = TRUE,
           stringsAsFactors=FALSE,
           colClasses = c("character","character","numeric",
                          "numeric","numeric","numeric",
                          "numeric","numeric","numeric"))


#subset the data
PowerConsumption <- subset(data,
                           Date %in% c( "1/2/2007",
                                        "2/2/2007" )
)
