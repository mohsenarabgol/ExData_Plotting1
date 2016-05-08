##Getting and subseeting data

data<-read.table("household_power_consumption.txt", sep=";", na.string="?", header=TRUE)
final_data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##Making a variable that containts both date and time
Date_Time<-strptime(paste(final_data$Date, final_data$Time), "%d/%m/%Y %H:%M:%S")

##Plotting the Data
plot(Date_Time, final_data$Global_active_power, xlab="", ylab="Global Active Power (killowatts)", type="l")

##Saving as a png file 
dev.copy(png, "plot2.png")
dev.off()