data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
data_mod <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
string <- (paste(as.character(data_mod$Date), data_mod$Time))
data_mod$New_date <- as.POSIXct(string)

### PLOT 2 ###
plot(y=data_mod$Global_active_power, x=data_mod$New_date, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()