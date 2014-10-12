# Read data from the dates 2007-02-01 and 2007-02-02
cname <- colnames(read.table("~/household_power_consumption.txt", header = TRUE, sep = ";",  na.string = "?",nrows = 1))
data <- read.table("~/household_power_consumption.txt", sep = ";",  na.string = "?",skip = 66637, nrows = 2880, col.names = cname)

# Convert the Date and Time variables to Date/Time classes
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 3
Sys.setlocale("LC_TIME", "C")
plot(data$Date,data$Sub_metering_1,type="l", main="", xlab = "", ylab="Energy sub metering",ylim =c(0,38))
lines(data$Date,data$Sub_metering_2, col ="red")
lines(data$Date,data$Sub_metering_3, col ="blue")
legend("topright",lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex = 0.8)
dev.copy(png, file = "plot3.png", width = 480, height = 480, unit = "px")
dev.off()
