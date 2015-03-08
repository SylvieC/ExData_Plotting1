library(lubridate)
library(dplyr)
data <- read.csv("electric.txt", sep=";", header=TRUE)
df <- tbl_df(data)

#make the Date column elements into date object
df <- mutate(df, Date = dmy(Date))

#subset to get only the two rows with the 2 dates we need
my_date = ymd("2007-02-01")
other_date = my_date + days(1)
data <- filter(df, Date == my_date | Date == other_date)

#make Time column a date time object
data <- mutate(data, Time = hms(Time))

#create a new column that add Date Object and Time object
data <- mutate(data, DateTime = Date + Time)


png(file="plot4.png", width=480, height=480, units="px", bg="transparent")
par(mfrow=c(2,2))
#1st plot
plot(data$DateTime, data$Global_active_power, type="n", xlab='', ylab="Global Active Power", pch=".")
lines(data$DateTime, data$Global_active_power, pch = ".")

#second plot
plot(data$DateTime, data$Voltage, type="n", xlab="datetime", ylab="Voltage")
lines(data$DateTime, data$Voltage)

#third plot
plot(data$DateTime, data$Sub_metering_1, type="n", xlab='', ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("grey", "red", "blue"), lwd=c(1,1,1), bty="n")

#4th plot
plot(data$DateTime, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$DateTime, data$Global_reactive_power)

