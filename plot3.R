setwd("/Users/hlchia/documents/data/ExData_Plotting1")

### get data
data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")

### convert date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

### get only data between 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

### Converting dates - combine date with time and convert as date time
datetime <- paste(data$Date, data$Time, sep = " ")
data$Datetime <- as.POSIXct(datetime)

### Plot 3
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


### Save file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()