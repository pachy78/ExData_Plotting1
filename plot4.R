#This script generates 4 line graphs analizing different values measured 
#for the electric power consumption in one household during February 
#1st and February 2nd, 2007.

#Reading the data (extracted from the household_power_consumption.txt)
consumption <- read.table(file="touse.txt",header = TRUE, "sep"=";",as.is = TRUE)
consumption$FullDate <- strptime(paste(consumption$Date,consumption$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

#Creating the 4 graphs
#Parameters

par(mfrow=c(2,2))


#First Plot (1,1)
with(consumption,plot(FullDate,Global_active_power,type="l", main = "",
                      ylab="Global Active Power (kilowatts)",xlab=""))

#Second Plot 
with(consumption,plot(FullDate,Voltage,type="l", 
                      ylab="Voltage",xlab="datetime"))

#Third Plot
with(consumption,plot(FullDate, Sub_metering_1,type = "n",
                      main = "",
                      xlab="", ylab = "Energy sub metering"))
with(consumption,points(FullDate, consumption$Sub_metering_1, col="black",
                        type="l"))
with(consumption,points(FullDate, consumption$Sub_metering_2, col="red",
                        type="l"))
with(consumption,points(FullDate, consumption$Sub_metering_3, col="blue",
                        type="l"))
legend("topright",pch="_", col = c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#Fourth Plot
with(consumption,plot(FullDate,Global_reactive_power,type="l", 
                      xlab="datetime"))

#Adding a Header and the Plot Name
mtext("Plot 4",outer = TRUE, line = -1, cex=1.2)
mtext("Various Measures for the electric power consumption in one household ",
      outer = TRUE, line = -3, cex=1)


#Creating the png file
if(!file.exists("plots")) {dir.create("plots")}
dev.copy(png, file = "./plots/plot4.png",width = 480, height = 480)
dev.off()

#Making mfrow of 1 column and 1 row
(par(mfrow=c(1,1)))

