# Read the data and select the proper subset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Combine the Date and Time columns into a single POSIXlt column
timestamp <- as.POSIXlt(paste(data[,1], data[,2]), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(timestamp, data[,-c(1,2)])

# Plot the graph onto a png
png(filename = "plot4.png")

par(mfcol = c(2,2))

# First plot
plot(data$timestamp, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Second plot
plot(data$timestamp, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
plot(data$timestamp, data$Sub_metering_2, type = "l", ylim = range(data$Sub_metering_1), col = "red", xlab = "", ylab = "")
par(new = TRUE)
plot(data$timestamp, data$Sub_metering_3, type = "l", ylim = range(data$Sub_metering_1), col = "blue", xlab = "", ylab = "")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")

# Third plot
plot(data$timestamp, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Fourth plot
plot(data$timestamp, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()