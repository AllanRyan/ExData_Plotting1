
if(!file.exists("./data"))(dir.create("./data"))

library(downloader)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest= "power.zip", mode="wb") 
#unzip ("power.zip", exdir = "./")
unzip(zipfile="power.zip",exdir="./data")
power <-read.csv("./data/household_power_consumption.txt",sep=";",
                 header=T, na.strings="?", 
                 check.names=F, stringsAsFactors=F)
names(power)
library(dplyr)
library(lubridate)
View(power)
power1 <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]
power1$datetime <- paste(power1$Date, power1$Time)
power1$datetime1 <- strptime(power1$datetime, "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480, res = 72)
plot(power1$datetime1, power1$Global_active_power, type="l", xlab = "",
     ylab="Global Active Power (kilowatts)", font.lab= 1)



dev.off()
