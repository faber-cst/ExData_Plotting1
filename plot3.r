## Read data
eletr <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Convert Date and Time, and Subset file
eletr$Datetime <- paste(eletr$Date,eletr$Time)
eletr$Datetime <- strptime(eletr$Datetime, "%d/%m/%Y %H:%M:%S")
eletr$Date <- as.Date(eletr$Date,format="%d/%m/%Y")
eletrsub <- subset(eletr, eletr$Date >= "2007-02-01" & eletr$Date <= "2007-02-02")

## Convert factor labels in numeric values
eletrsub$Sub_metering_1 <- as.numeric(as.character(eletrsub$Sub_metering_1))
eletrsub$Sub_metering_2 <- as.numeric(as.character(eletrsub$Sub_metering_2))
eletrsub$Sub_metering_3 <- as.numeric(as.character(eletrsub$Sub_metering_3))


## Make the plot
png("Plot3.png", width = 480, height= 480)
plot(eletrsub$Datetime,eletrsub$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(eletrsub$Datetime, eletrsub$Sub_metering_2,col="Red")
lines(eletrsub$Datetime, eletrsub$Sub_metering_3,col="Blue")
legend("topright", lwd=1, col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()