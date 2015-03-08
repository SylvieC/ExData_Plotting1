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

#plots the datat
plot(data$DateTime, data$Global_active_power, type="n", xlab='', ylab="Global Active Power (kilowatts)", pch=".")
lines(data$DateTime, data$Global_active_power, pch = ".")

#copy to png file
dev.copy(png, file="plot2.png", width=480, height=480, units="px")

