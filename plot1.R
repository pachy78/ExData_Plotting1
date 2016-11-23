#This script generates a histogram of the global active power in kilowats
#for the electric power consumption in one household during February 1st and
#February 2nd, 2007.


#Reading the data (extracted from the household_power_consumption.txt)
consumption <- read.table(file="touse.txt",header = TRUE, "sep"=";",as.is = TRUE)
consumption$FullDate <- strptime(paste(consumption$Date,consumption$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

#Creating the png file
if(!file.exists("plots")) {dir.create("plots")}
png(filename = "./plots/plot1.png",width = 480, height = 480)

#Creating the histogram
with(consumption,hist(Global_active_power,col="red",main = "Global Active Power",
                      xlab="Global Active Power (kilowatts)"))
#Closing the conection
dev.off()


#Removing the data set from memory
rm(consumption)