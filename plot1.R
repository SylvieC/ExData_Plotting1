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

#draw the histogram
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power(kilowatts)")

#copy to a png file
dev.copy(png, file="plot1.png", width=480, height=480, units="px")




