
data <- read.csv(file = "household_power_consumption.txt", head = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))
sub_data$Sub_metering_1 <- as.numeric(as.character(sub_data$Sub_metering_1))
sub_data$Sub_metering_2 <- as.numeric(as.character(sub_data$Sub_metering_2))
sub_data$Sub_metering_3 <- as.numeric(as.character(sub_data$Sub_metering_3))
sub_data$Global_reactive_power <- as.numeric(as.character(sub_data$Global_reactive_power))
sub_data$Voltage <- as.numeric(as.character(sub_data$Voltage))
        
sub_data <- transform(sub_data, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


par(mfrow = c(2,2))

plot(sub_data$timestamp,sub_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(sub_data$timestamp,sub_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(sub_data$timestamp, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sub_data$timestamp, sub_data$Sub_metering_2, col = "red")
lines(sub_data$timestamp, sub_data$Sub_metering_3, col = "blue")              
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = 1, bty = "n", cex = 0.5)      

plot(sub_data$timestamp, sub_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()