# download file from the url
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "./household_power_consumption.csv")

#Read the full file  
hpc <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

#subsetting the data
hpcsubset <- subset(hpc, (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(hpcsubset$Date), hpcsubset$Time)
hpcDatetime <- as.POSIXct(datetime)


#Subset the data 
globalActivePower <- as.numeric(hpcsubset$Global_active_power)
subMetering1 <- as.numeric(hpcsubset$Sub_metering_1)
subMetering2 <- as.numeric(hpcsubset$Sub_metering_2)
subMetering3 <- as.numeric(hpcsubset$Sub_metering_3)

#Plot3
plot(hpcDatetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(hpcDatetime, subMetering2, type="l", col="red")
lines(hpcDatetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Saving it to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()





