hp<-fread("household_power_consumption.txt",na.strings = "?")
hp_select<-hp[hp$Date %in% c("1/2/2007","2/2/2007"),]# subset for 2007/2/1 and 2007/2/2
datetime<-paste(hp_select$Date,hp_select$Time)       # paste the Date and time columns together
datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")     #convert datetime to date/time format
datetime<-as.POSIXct(datetime)
hp_select<-cbind(hp_select,datetime)                 # add datetime to end of hp_select

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(hp_select,{plot(datetime,Global_active_power,type="l",
                     xlab="",ylab="Global Active Power")
                plot(datetime,Voltage,type="l")
                {plot(datetime,Sub_metering_1,
                type = "n",xlab="",ylab="Energy sub metering")
                lines(datetime,Sub_metering_1,type="l",col="black")
                lines(datetime,Sub_metering_2,type="l",col="red")
                lines(datetime,Sub_metering_3,type="l",col="blue")
                legend("topright",lty=1,col=c("black","red","blue"),
                legend = names(hp_select)[7:9],bty="n")}
                plot(datetime,Global_reactive_power,type="l")})
dev.off()
