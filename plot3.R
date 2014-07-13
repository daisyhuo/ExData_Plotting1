	## Read Data
	rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")
	
	## Covert Date and Time in data
	rawdata$Date <- as.Date(as.character(rawdata$Date), "%d/%m/%Y")

	## Subset the data on "2007-02-01" and "2007-02-02"
	data <- subset(rawdata, Date == "2007-02-01" | Date == "2007-02-02")
	
	## Plot 
	png(filename = "plot3.png", width = 480, height = 480, units = "px")
	date <- paste(as.character(data$Date), as.character(data$Time))
	date <- strptime(date, "%Y-%m-%d %H:%M:%S")
	sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
	sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
	sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
	
	


	
	dev.off()
