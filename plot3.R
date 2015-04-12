data <- read.csv("./household_power_consumption.txt", header=T, sep=";", na.string="?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subdata$Sub_metering_2, type="l", col="red")
lines(datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black",NA, "red",NA, "blue"), lty=c(1,1,1), lwd=2, c("Sub_metering_1",NA, "Sub_metering_2",NA, "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()