
## reading data and setting missing values "?" to NA
household_pc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

##subsetting data
subdata<-household_pc[household_pc$Date %in% c("1/2/2007","2/2/2007"),]

##converting Global_active_power variable to numeric
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

##calling png function and creating histogram
png("plot1.png", width=480, height=480)
hist(subdata$Global_active_power,xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col = "Red")
dev.off()
