data <- read.csv("./household_power_consumption.txt", header=T, sep=";", na.string="?")
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subdata$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()