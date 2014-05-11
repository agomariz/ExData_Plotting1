# plot4.R - Several plots for time series for global active power, voltage,
#           submetering and global reactive power# We load the data

data <- read.table('household_power_consumption.txt', sep=';', header=T, 
                   colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric'),
                   na.strings='?')

# We convert the the date and time variables in the R date/time class
data$dateAndTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# And we only select those between 2007-02-01 and 2007-02-02
data <- data[as.Date(data$dateAndTime) >= as.Date("2007-02-01") & 
                     as.Date(data$dateAndTime) <= as.Date("2007-02-02"),]

# We open the png device and we call it plot4.png
png("plot4.png", height=480, width=480)

# We establish 2 rows and 2 columns for the multiplot
par(mfrow=c(2,2))

# First plot
plot(data$dateAndTime, data$Global_active_power, pch="", xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$dateAndTime, data$Global_active_power)

# Second plot
plot(data$dateAndTime, data$Voltage, ylab="Voltage", xlab="datetime", pch="")
lines(data$dateAndTime, data$Voltage)

# Third plot
plot(data$dateAndTime, data$Sub_metering_1, pch="", xlab="", 
     ylab="Energy sub metering")
lines(data$dateAndTime, data$Sub_metering_1)
lines(data$dateAndTime, data$Sub_metering_2, col='red')
lines(data$dateAndTime, data$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c('black', 'red', 'blue'),bty="n")

# Fourth plot
plot(data$dateAndTime, data$Global_reactive_power, xlab='datetime',ylab='Global_reactive_power', pch="")
lines(data$dateAndTime, data$Global_reactive_power)

# Close PNG file
dev.off()