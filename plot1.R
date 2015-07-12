## Sanem Seren Sever C_EDA - A1
## plot1.R (plot1.png)
###############################

## Attention: WD must contain the source data
## Read data for plotting:
inputData = read.table('household_power_consumption.txt', header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Subset the data for required timeline (between: 2007-02-01 and 2007-02-02)
## and create the plot:
inputData$Date = as.Date(inputData$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
focusData=subset(inputData, Date >= startDate & Date <= endDate)
rm(inputData)

#PLOT1
png(filename="plot1.png",width=480,height=480)
with(focusData,hist(focusData$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red"))
dev.off()