# Read data from the dates 2007-02-01 and 2007-02-02
cname <- colnames(read.table("~/household_power_consumption.txt", header = TRUE, sep = ";",  na.string = "?",nrows = 1))
data <- read.table("~/household_power_consumption.txt", sep = ";",  na.string = "?",skip = 66637, nrows = 2880, col.names = cname)

# Convert the Date and Time variables to Date/Time classes
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 2
Sys.setlocale("LC_TIME", "C")
plot(data$Date,data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480, unit = "px")
dev.off()