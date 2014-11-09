dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
dat <- subset(dat, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

datetime <- paste(as.Date(dat$Date), dat$Time)
dat$Datetime <- as.POSIXct(datetime)

hist(dat$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
