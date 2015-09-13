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

my_data_Y1 <- data$Sub_metering_1
my_data_Y1 <- as.numeric(as.character(my_data_Y1))
my_data_Y2 <- data$Sub_metering_2
my_data_Y2 <- as.numeric(as.character(my_data_Y2))
my_data_Y3 <- data$Sub_metering_3
my_data_Y3 <- as.numeric(as.character(my_data_Y3))

my_data_Y4 <- subset(data,data$Global_reactive_power != "?")
my_data_Y4 <- my_data_Y4$Global_reactive_power
my_data_Y4 <- as.numeric(as.character(my_data_Y4))

my_data_Y5 <- subset(data,data$Voltage != "?")
my_data_Y5 <- my_data_Y5$Voltage
my_data_Y5 <- as.numeric(as.character(my_data_Y5))

par(mfrow=c(2,2))
plot(my_data_X,my_data_Y,ylab = "Global Active Power (kilowatts)",xlab="", type="n") 
lines(my_data_X, my_data_Y,type="l")

plot(my_data_X,my_data_Y5,ylab = "Voltage",xlab="datetime", type="n") 
lines(my_data_X, my_data_Y5,type="l")


plot(my_data_X,my_data_Y1,ylab = "Energy Sub Metering",xlab="", type="n") 
points(my_data_X,my_data_Y2, type="n") 
points(my_data_X,my_data_Y3, type="n") 
lines(my_data_X, my_data_Y1,type="l",lwd=2.5)
lines(my_data_X, my_data_Y2,type="l",col="red",lwd=2.5)
lines(my_data_X, my_data_Y3,type="l",col="blue",lwd=2.5)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","green"),
       lwd=1,cex=0.25)

plot(my_data_X,my_data_Y4,ylab = "Global Reactive Power",xlab="datetime", type="n") 
lines(my_data_X, my_data_Y4,type="l")

dev.copy(png,'plot4.png',width=480,height=480)


dev.off()