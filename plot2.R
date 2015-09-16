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

## PLOT 2
# 

plot(as.POSIXct(paste(dataSubset[,1], dataSubset[,2]), format="%Y-%m-%d %H:%M:%S"), dataSubset[,3], type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "", cex.lab = 0.75)