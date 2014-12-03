# Read the data and select the proper subset
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Combine the Date and Time columns into a single POSIXlt column
timestamp <- as.POSIXlt(paste(data[,1], data[,2]), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(timestamp, data[,-c(1,2)])

# Plot the graph onto a png
png(filename = "plot1.png")

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()