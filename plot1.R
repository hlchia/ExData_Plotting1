setwd("/Users/hlchia/documents/data/expdata")

### get data
data <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?")

### convert date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

### get only data between 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

### Converting dates - combine date with time and convert as date time
datetime <- paste(data$Date, data$Time, sep = " ")
data$Datetime <- as.POSIXct(datetime)

### Plot 1
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

### Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()