# plot3.R - Time Series for Global Active Power taked by submeter

# We load the data
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

# We open the png device and we call it plot3.png
png("plot3.png", height=480, width=480)

# we build the plot
plot(data$dateAndTime, data$Sub_metering_1, pch="", xlab="", 
     ylab="Energy sub metering")
lines(data$dateAndTime, data$Sub_metering_1)
lines(data$dateAndTime, data$Sub_metering_2, col='red')
lines(data$dateAndTime, data$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c('black', 'red', 'blue'))

# Finally we Close the .png file
dev.off()