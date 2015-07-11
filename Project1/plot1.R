

data <- read.csv(file = "household_power_consumption.txt", head = TRUE, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

sub_data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

sub_data$Global_active_power <- as.numeric(as.character(sub_data$Global_active_power))
hist(sub_data$Global_active_power, main = paste("Global Active Power"), col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()