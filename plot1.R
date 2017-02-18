
if(!file.exists("./data"))(dir.create("./data"))

library(downloader)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest= "power.zip", mode="wb") 
#unzip ("power.zip", exdir = "./")
unzip(zipfile="power.zip",exdir="./data")
power <-read.csv("./data/household_power_consumption.txt",
                 sep=";",header=T, na.strings="?", 
                 
                check.names=F, stringsAsFactors=F)
names(power)
library(dplyr)
library(lubridate)
View(power)
power1 <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]
#power$date <- as.Date(power$Date,"%d/%m/%Y")
power2 <- filter(power, 
    power$Date == "1/2/2007"
     | power$Date == "2/2/2007")

png("plot1.png", width = 480, height = 480, res = 72)

hist((power1$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     ylim= c(0,1300), col="Red") 




dev.off()
