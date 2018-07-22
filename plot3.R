
## reading data and setting missing values "?" to NA
household_pc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

##subsetting data 
subdata<-household_pc[household_pc$Date %in% c("1/2/2007","2/2/2007"),]


##converting submeter variables to numeric and date column to date

subdata$Sub_metering_1<-as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2<-as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3<-as.numeric(subdata$Sub_metering_3)
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
                        
#combining date and time variables to a new column                        
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")

###calling png function and creating line graph for wach submeter variable.
png("plot3.png", width=480, height=480)
plot(subdata$datetime, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subdata$datetime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
                        
