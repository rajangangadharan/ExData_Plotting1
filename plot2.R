options(scipen=99)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",method="curl",destfile="a.zip")
data <- read.table(unz("a.zip", "household_power_consumption.txt"),sep=";",dec=".", header = TRUE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data,data$Date > as.Date("2007-01-31"))
data <- subset(data,data$Date < as.Date("2007-02-03"))

my_data_X <- paste(as.character(data$Date),data$Time)
my_data_X <- strptime(my_data_X,"%Y-%m-%d %H:%M:%S")
my_data_Y <- subset(data,data$Global_active_power != "?")

my_data_Y <- my_data_Y$Global_active_power
my_data_Y <- as.numeric(as.character(my_data_Y))
plot(my_data_X,my_data_Y,ylab = "Global Active Power (kilowatts)",xlab="", type="n") 
lines(my_data_X, my_data_Y,type="l")
dev.copy(png,'plot2.png',width=480,height=480)


dev.off()