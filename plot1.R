hp<-fread("household_power_consumption.txt",na.strings = "?")
hp_select<-hp[hp$Date %in% c("1/2/2007","2/2/2007"),]# subset for 2007/2/1 and 2007/2/2
datetime<-paste(hp_select$Date,hp_select$Time)       # paste the Date and time columns together
datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")     #convert datetime to date/time format
par(mar=c(4,4,2,1))
png("plot1.png",width=480,height=480) # open png device
hist(as.numeric(hp_select$Global_active_power),breaks=12,col="red",
     ylim=c(0,1200),xlab="Global Active Power (kilowatts)",main="Global Active Power") #plot
dev.off() # turn device off

