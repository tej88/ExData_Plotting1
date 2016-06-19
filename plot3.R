##loading file
fileData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, na.strings = "?", quote='\"')
fileData$Date <- as.Date(fileData$Date, format = "%d/%m/%Y")
##subsetting into specific days
dataDays <- subset(fileData, subset = (Date > "2007-01-31" & Date < "2007-02-03"))
##changing date format
dayOfWeek <- paste(as.Date(dataDays$Date), dataDays$Time)
dataDays$DayOfWeek <- as.POSIXct(dayOfWeek)
##plotting
with(dataDays, {
    plot(Sub_metering_1 ~ DayOfWeek, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ DayOfWeek, col = "Red")
    lines(Sub_metering_3 ~ DayOfWeek, col = "Blue")
})
##legend
legend("topright", col = c("black", "red", "blue"), lwd = 2, lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))