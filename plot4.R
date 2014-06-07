#Load and process the data into R
file <- "household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#Plot the graphic
png("plot4.png", width = 480, height = 480, bg = "transparent")
par(mfcol = c(2, 2))
with(data, {
  #1,1 plot
  plot(datetime, Global_active_power, type = "l",
       xlab = "", ylab = "Global Active Power (kilowatts)")

  #2,1 plot
  plot(datetime, Sub_metering_1,  type = "l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #1,2 plot  
  plot(datetime, Voltage, type = "l")
  
  #2,2 plot  
  plot(datetime, Global_reactive_power, type = "l")
})

dev.off()
