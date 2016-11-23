#This script generates a line graph of the global active power consumed per 
#day-time for the electric power consumption in one household during February 
#1st and February 2nd, 2007.

#Reading the data (extracted from the household_power_consumption.txt)
consumption <- read.table(file="touse.txt",header = TRUE, "sep"=";",as.is = TRUE)
consumption$FullDate <- strptime(paste(consumption$Date,consumption$Time), 
                                 format="%d/%m/%Y %H:%M:%S")
#Creating the png file
if(!file.exists("plots")) {dir.create("plots")}
png(filename = "./plots/plot2.png",width = 480, height = 480)

#Creating the line graph
with(consumption,plot(FullDate,Global_active_power,type="l", 
                      ylab="Global Active Power (kilowatts)",xlab=""))

#Closing the conection
dev.off()


#Removing the data set from memory
rm(consumption)