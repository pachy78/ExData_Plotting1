#This script generates line graphs for the 3 different sub metering  per 
#day-time for the electric power consumption in one household during February 
#1st and February 2nd, 2007.

#For this script I had to rev

#Reading the data (extracted from the household_power_consumption.txt)
consumption <- read.table(file="touse.txt",header = TRUE, "sep"=";",as.is = TRUE)
consumption$FullDate <- strptime(paste(consumption$Date,consumption$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

#Creating the png file
if(!file.exists("plots")) {dir.create("plots")}
png(filename = "./plots/plot3.png",width = 480, height = 480)

#Creating the line graphs
with(consumption,plot(FullDate, Sub_metering_1,type = "n", 
                                 xlab="", ylab = "Energy sub metering"))
with(consumption,points(FullDate, consumption$Sub_metering_1, col="black",
                        type="l"))
with(consumption,points(FullDate, consumption$Sub_metering_2, col="red",
                        type="l"))
with(consumption,points(FullDate, consumption$Sub_metering_3, col="blue",
                        type="l"))
legend("topright",pch="_", col = c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))


#Closing the conection
dev.off()

#Removing the data set from memory
rm(consumption)

