data1 <- read.table("household_power_consumption.txt", 
                    sep = ';', na.strings = '?', header = TRUE);
#Converting the Date and Time
data1$DateTime <- paste(data1$Date, data1$Time)
data1$DateTime <- as.POSIXct(data1$DateTime, format = "%d/%m/%Y %H:%M:%S")

#subsetting the data
data1$Date <- as.Date(data1$Date, format='%d/%m/%Y')
bottom <- as.Date('01/02/2007', format='%d/%m/%Y')
top <- as.Date('02/02/2007', format='%d/%m/%Y')
subdata1 <- subset(data1,Date >= bottom & Date <=top)
png("plot1.png")
hist(subdata1$Global_active_power,main="Global Active Power",ylab="Frequency",
     xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()