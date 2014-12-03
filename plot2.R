# Read the data and select the proper subset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Combine the Date and Time columns into a single POSIXlt column
timestamp <- as.POSIXlt(paste(data[,1], data[,2]), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(timestamp, data[,-c(1,2)])

# Plot the graph onto a png
png(filename = "plot2.png")

plot(data$timestamp, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()