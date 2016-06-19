##loading file
energyFile <- file("household_power_consumption.txt")
fileData <- read.table(text=grep("^[1,2]/2/2007", readLines(energyFile), value = TRUE), sep = ";", header = TRUE)
##plotting histogram
hist(fileData[[3]], col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
