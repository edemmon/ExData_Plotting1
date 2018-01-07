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

#graph
png("plot4.png")
#set up visual frame
par(mfrow=c(2,2))
#graph 1
with(subdata1, plot(DateTime, Global_active_power, 
                    type="line",xlab="",ylab="Global Active Power (kilowatts)")
)
#graph 2
with(subdata1, plot(DateTime, Voltage, 
                    type="line",xlab="datetime",ylab="Voltage")
)
#graph 3
with(subdata1, plot(DateTime, Sub_metering_1, 
                    type="n",xlab="",ylab="Energy sub metering"))
with(subdata1, points(DateTime, Sub_metering_1, type="line"))
with(subdata1, points(DateTime, Sub_metering_2, type="line", col="red"))
with(subdata1, points(DateTime, Sub_metering_3, type="line", col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=c(1,1,1))
#graph 4
with(subdata1, plot(DateTime, Global_reactive_power, 
                    type="line",xlab="datetime",ylab="Global_reactive_power")
)
dev.off()