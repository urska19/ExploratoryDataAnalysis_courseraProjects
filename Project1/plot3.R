

data <- read.csv(file="household_power_consumption.txt", head = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

sub_data$Sub_metering_1 <- as.numeric(as.character(sub_data$Sub_metering_1))
sub_data$Sub_metering_2 <- as.numeric(as.character(sub_data$Sub_metering_2))
sub_data$Sub_metering_3 <- as.numeric(as.character(sub_data$Sub_metering_3))

sub_data <- transform(sub_data, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


plot(sub_data$timestamp, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sub_data$timestamp, sub_data$Sub_metering_2, col = "red")
lines(sub_data$timestamp, sub_data$Sub_metering_3, col = "blue")
       
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),lwd = c(2.5,2.5,2.5), col = c("black","red","blue"))      
       
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()