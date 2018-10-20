library(readr)

hpcDF <- read_delim("Ryan/Education/Coursera_Data_Science_Specialization/04_ExploratoryAnalysis/2018-August/household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)
as.data.frame(hpcDF)
hpcDF$Date <- as.Date(hpcDF$Date, "%d/%m/%Y")
hpcDF <- subset(hpcDF, Date == '2007-02-01' | Date == '2007-02-02')
hpcDF$Time <- format(strptime(hpcDF$Time, "%H:%M:%S"),"%H:%M:%S")
hpcDF$DateTime <- as.POSIXct(paste(hpcDF$Date, hpcDF$Time), format="%Y-%m-%d %H:%M:%S")

plot(x=hpcDF$DateTime,
     y=hpcDF$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowats)")

dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()