## Read data
eletr <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Convert Date and Time, and Subset file
eletr$Datetime <- paste(eletr$Date,eletr$Time)
eletr$Datetime <- strptime(eletr$Datetime, "%d/%m/%Y %H:%M:%S")
eletr$Date <- as.Date(eletr$Date,format="%d/%m/%Y")
eletrsub <- subset(eletr, eletr$Date >= "2007-02-01" & eletr$Date <= "2007-02-02")

## Convert factor labels in numeric values
eletrsub$Global_active_power <- as.numeric(as.character(eletrsub$Global_active_power))

## Make the plot
png("Plot2.png", width = 480, height= 480)
plot(eletrsub$Datetime,eletrsub$Global_active_power, type="l",ylab="Global Active Power (kilowatt)", xlab="")
dev.off()