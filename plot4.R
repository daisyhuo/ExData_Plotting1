	## Read Data
	rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")
	
	## Covert Date and Time in data
	rawdata$Date <- as.Date(as.character(rawdata$Date), "%d/%m/%Y")

	## Subset the data on "2007-02-01" and "2007-02-02"
	data <- subset(rawdata, Date == "2007-02-01" | Date == "2007-02-02")
	
	## Plot 
	png(filename = "plot4.png", width = 480, height = 480, units = "px")
	date <- paste(as.character(data$Date), as.character(data$Time))
	date <- strptime(date, "%Y-%m-%d %H:%M:%S")
	global_active_power <- as.numeric(as.character(data$Global_active_power))
	voltage <- as.numeric(as.character(data$Voltage))
	sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
	sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
	sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
	global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
	
	par(mfrow = c(2, 2))
	## First figure
	plot(date, global_active_power, type = 'l', col = "black", xlab = "", ylab = "Global Active Power")
	
	## Second figire
	plot(date, voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")
	
	## Third figure
	plot(date, sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
	lines(date, sub_metering_1, type = "l", col = "black")
	lines(date, sub_metering_2, type = "l", col = "red")
	lines(date, sub_metering_3, type = "l", col = "blue")
	legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), border = "white", bty="n")

	## Forth figure
	plot(date, global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")


	dev.off()