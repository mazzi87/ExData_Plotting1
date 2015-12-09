data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
data_mod <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
string <- (paste(as.character(data_mod$Date), data_mod$Time))
data_mod$New_date <- as.POSIXct(string)

### PLOT 1 ###
hist(data_mod$Global_active_power, xlab ="Global Active Power (kilowatts)", ylab = "Frequency", main ="Global Active Power", col ="red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
