# download, unzip, read and subset the table

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")
dataPower <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- dataPower[as.Date(dataPower$Date, "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")),] #

# save subset table
write.table(data, "dataSubset.csv", row.names=FALSE, col.names=TRUE)

# read new table with only the rows containing data for Feb 01-02, 2007
dataSubset <- read.csv("dataSubset.csv", sep = "")
dataSubset[,1] <- as.Date(dataSubset[,1], "%d/%m/%Y")
dateHour <- as.POSIXct(paste(dataSubset[,1], dataSubset[,2]), format="%Y-%m-%d %H:%M:%S")

## PLOT 4
# 

par(mfrow=c(2,2))

    plot(as.POSIXct(paste(dataSubset[,1], dataSubset[,2]), format="%Y-%m-%d %H:%M:%S"), dataSubset[,3], type = 'l', ylab = "Global Active Power", xlab = "", cex.lab = 0.75)

    plot(dateHour, dataSubset[,5], type = 'l', ylab = "Voltage", xlab = "datetime", cex.lab = 1, col = "black")

    plot(dateHour, dataSubset[,7], type = 'l', ylab = "Energy sub metering", xlab = "", cex.lab = 0.75, col = "black", ylim=c(0, max(dataSubset[,7])))
    par(new=T)
    plot(dateHour, dataSubset[,8], type = 'l', col = "red", ylim=c(0, max(dataSubset[,7])), xlab="", ylab="")
    par(new=T)
    plot(dateHour, dataSubset[,9], type = 'l', col = "blue", ylim=c(0, max(dataSubset[,7])), xlab="", ylab="")
    legend("topright", c(names(dataSubset)[7], names(dataSubset)[8], names(dataSubset)[9]), col = c("black", "red", "blue"), lty=1, cex=.75)

    plot(dateHour, dataSubset[,4], type = 'l', xlab = "datetime", ylab=names(dataSubset)[4], cex.lab = 1, col = "black")
