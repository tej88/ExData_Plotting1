##loading file
fileData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, na.strings = "?", quote='\"')
fileData$Date <- as.Date(fileData$Date, format = "%d/%m/%Y")
##subsetting into specific days
dataDays <- subset(fileData, subset = (Date > "2007-01-31" & Date < "2007-02-03"))
##changing date format
dayOfWeek <- paste(as.Date(dataDays$Date), dataDays$Time)
dataDays$DayOfWeek <- as.POSIXct(dayOfWeek)
##plotting
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(dataDays, {
    plot(Global_active_power ~ DayOfWeek, type = "l", ylab = "Global Active Power", xlab = "")
    plot(Voltage ~ DayOfWeek, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1 ~ DayOfWeek, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ DayOfWeek, col = "Red")
    lines(Sub_metering_3 ~ DayOfWeek, col = "Blue")
    legend("topright", col = c("black", "red", "blue"), lwd = 2, lty = 1, 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ DayOfWeek, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})