##Getting and subseeting data

data<-read.table("household_power_consumption.txt", sep=";", na.string="?", header=TRUE)
final_data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##Making a variable that containts both date and time
Date_Time<-strptime(paste(final_data$Date, final_data$Time), "%d/%m/%Y %H:%M:%S")

##Plotting the Data
par(mfrow=c(2,2))
plot(Date_Time, final_data$Global_active_power, xlab="", ylab="Global Active Power", type="l", cex.lab=0.7)
plot(Date_Time, final_data$Voltage, xlab="datetime", ylab="Voltage", type="l", cex.lab=0.7)
plot(Date_Time, final_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", cex=0.7, cex.lab=0.7)
lines(Date_Time, final_data$Sub_metering_2, col="red")
lines(Date_Time, final_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering-1","Sub_metering-2","Sub_metering-3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.5)
plot(Date_Time, final_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l", cex.lab=0.7)

##Saving as a png file 
dev.copy(png, "plot4.png")
dev.off()

