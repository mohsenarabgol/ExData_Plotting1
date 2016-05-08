##Getting and subseeting data

data<-read.table("household_power_consumption.txt", sep=";", na.string="?", header=TRUE)
final_data<-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

##Plotting the Data
hist(final_data$Global_active_power, xlab="Global Active Power (killowatts)", main="Global Active Power", col="red")

##Saving as a png file 
dev.copy(png, "plot1.png")
dev.off()