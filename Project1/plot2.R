

data <- read.csv(file = "household_power_consumption.txt", head = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))

sub_data <- transform(sub_data, timestamp = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(sub_data$timestamp, sub_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()