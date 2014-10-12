setwd("/Users/hlchia/documents/data/ExData_Plotting1")

### get data
data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")

### convert date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

### get only data between 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

### Converting dates - combine date with time and convert as date time
datetime <- paste(data$Date, data$Time, sep = " ")
data$Datetime <- as.POSIXct(datetime)

### Plot 2
plot(data$Global_active_power ~ data$Datetime, type = "l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

### Save file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()