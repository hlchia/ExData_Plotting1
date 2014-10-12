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

### Plot 4

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

with(data, {
  plot(Global_active_power ~ Datetime, type = "l", 
       xlab ="", 
       ylab = "Global Active Power")
  
  plot(Voltage ~ Datetime, type = "l", 
       xlab = "",
       ylab = "Voltage")
  
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       xlab="",
       ylab="Energy sub metering")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type = "l", 
       xlab = "", 
       ylab = "Global_rective_power")
})



### Save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()