#Load and process the data into R
file <- "household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#Plot the graphic
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(data$datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
