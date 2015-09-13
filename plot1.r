## Read data
eletr <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## Convert Date and Subset file
eletr$Date <- as.Date(eletr$Date,format="%d/%m/%Y")
eletrsub <- subset(eletr, eletr$Date >= "2007-02-01" & eletr$Date <= "2007-02-02")

## Convert factor labels in numeric values
eletrsub$Global_active_power <- as.numeric(as.character(eletrsub$Global_active_power))

## Make the plot
png("Plot1.png", width = 480, height= 480)
hist(eletrsub$Global_active_power, xlab="Global Active Power(kilowatts)", main="Global Active Power", col= "Red")
dev.off()