# download, unzip, read and subset the table

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method="curl")
unzip("household_power_consumption.zip")
dataPower <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data <- dataPower[as.Date(dataPower$Date, "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")),] #

# save subset table
write.table(data, "dataSubset.csv", row.names=FALSE, col.names=TRUE)

# read new table with only the rows containing data for Feb 01-02, 2007
dataSubset <- read.csv("dataSubset.csv", sep = "")

## PLOT 1
# make a histogram
hist(as.numeric(dataSubset[,3]), col = "red", main = "Global Active Power", border = "black", xlab = "Global Active Power (kilowatts)")
