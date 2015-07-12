## Sanem Seren Sever C_EDA - A1
## plot2.R (plot2.png)
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

#PLOT3
png(filename="plot3.png", width=480, height=480)
plot(focusData$DateTime,
     focusData$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering",
     main="")
lines(focusData$DateTime, focusData$Sub_metering_2, col="red")
lines(focusData$DateTime, focusData$Sub_metering_3, col="blue")
legend("topright",
       lwd=1,
       lty=1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()