## Read the power consumption data set
powerData <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?")

## Format the date field to "date" format
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

#Read data for the dates 1st and 2nd Feb 2007
data <- subset(powerData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Free up the memory and delete the full data and retain only the subset
rm(powerData)

## Converting dates 
dateTime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(dateTime)

## Plot 3  
with(data, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
graphics.off()
