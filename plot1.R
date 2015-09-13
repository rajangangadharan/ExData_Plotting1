options(scipen=99)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",method="curl",destfile="a.zip")
data <- read.table(unz("a.zip", "household_power_consumption.txt"),sep=";",dec=".", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,data$Date > as.Date("2007-01-31"))
data <- subset(data,data$Date < as.Date("2007-02-03"))
my_num_data <- subset(data,data$Global_active_power != "?")
my_num_data <- my_num_data$Global_active_power
my_num_data <- as.numeric(as.character(my_num_data))
png(file="plot1.png",width=480,height=480)
hist(my_num_data,main="Global Active Power", freq=TRUE,xlab = "Global Active Power (kilowatts)", col = "red" )
dev.off()


