# plot1.R - Histogram for Global Active Power

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

# We open the png device and we call it plot1.png
png("plot1.png", height=480, width=480)

# we build the plot
hist(data$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')

# Finally we Close the .png file
dev.off()