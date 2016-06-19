##loading file
fileData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, na.strings = "?", quote='\"')
fileData$Date <- as.Date(fileData$Date, format = "%d/%m/%Y")
##subsetting into specific days
dataDays <- subset(fileData, subset = (Date > "2007-01-31" & Date < "2007-02-03"))
##changing date format
dayOfWeek <- paste(as.Date(dataDays$Date), dataDays$Time)
dataDays$DayOfWeek <- as.POSIXct(dayOfWeek)
##plotting
plot(dataDays$Global_active_power ~ dataDays$DayOfWeek, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
