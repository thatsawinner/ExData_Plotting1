library(readr)

hpcDF <- read_delim("Ryan/Education/Coursera_Data_Science_Specialization/04_ExploratoryAnalysis/2018-August/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
as.data.frame(hpcDF)
hpcDF$Date <- as.Date(hpcDF$Date, "%d/%m/%Y")
hpcDF <- subset(hpcDF, Date == '2007-02-01' | Date == '2007-02-02')
hpcDF$Time <- format(strptime(hpcDF$Time, "%H:%M:%S"),"%H:%M:%S")
hpcDF$DateTime <- as.POSIXct(paste(hpcDF$Date, hpcDF$Time), format="%Y-%m-%d %H:%M:%S")

plot(x=hpcDF$DateTime,
     y=hpcDF$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")
lines(hpcDF$DateTime, hpcDF$Sub_metering_2, col="red")
lines(hpcDF$DateTime, hpcDF$Sub_metering_3, col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=1, cex = 0.5)

dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()