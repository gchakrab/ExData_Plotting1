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


#Subset the data for global active power
globalActivePower <- as.numeric(hpcsubset$Global_active_power)

#Plot2
plot(hpcDatetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Saving it to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()