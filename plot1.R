#Load and process the data into R
file <- "household_power_consumption.txt"
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
data <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

#Plot the graphic
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
