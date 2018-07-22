
## reading data and setting missing values "?" to NA
household_pc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

##subsetting data 
subdata<-household_pc[household_pc$Date %in% c("1/2/2007","2/2/2007"),]
)

##converting Global_active_power variable to numeric and formatting date variable to date
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y"
                        
#combining date and time variables to a new column                        
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")

##calling png function and creating line graph

png("plot2.png", width=480, height=480)
plot(subdata$datetime,subdata$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab=""
     )
dev.off()
