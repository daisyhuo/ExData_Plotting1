	
	## Read Data
	rawdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.string = "?")
	
	## Covert Date and Time in data
	rawdata$Date <- as.Date(as.character(rawdata$Date), "%d/%m/%Y")

	## Subset the data on "2007-02-01" and "2007-02-02"
	data <- subset(rawdata, Date == "2007-02-01" | Date == "2007-02-02")
	
	
	## Plot histogram of global active power
	png(filename = "plot1.png", width = 480, height = 480, units = "px")
	global_active_power <- as.numeric(as.character(data$Global_active_power))
	hist(global_active_power, col = "red", main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
	dev.off()
