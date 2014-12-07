##data should be in your working directory
data<-read.table("household_power_consumption.txt",header=TRUE, sep= ";", na.strings="?")
data$Date<-as.Date(data2$Date,"%d/%m/%Y")

##condition for dsubset the wanted data
data<-data [ ifelse (data$Date=="2007-02-01" | data$Date=="2007-02-02" ,TRUE,FALSE) ,]

#pasting the data and the time
data$date_time<-with(data, paste(Date, Time, sep = " ")) 
data$date_time<-strptime(data$date_time,format= "%Y-%m-%d %H:%M:%S")

#plot 4
par(mfrow=c(2,2))

#first graph
plot(data$date_time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#second graph
plot(data$date_time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

#third one
plot(data$date_time,data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(data$date_time,data$Sub_metering_2, type="l",col="red")
lines(data$date_time,data$Sub_metering_3, type="l",col="blue")
name<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colors<-c("black","red","blue")
#legend("topright", legend=name, col=colors,lty=c(1,1,1))
#I am very late in the assignement so I will submit the graph without 
#resize th legend. I will do it afterwards sorry for that.

#fourth one
plot(data$date_time,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,'plot4.png')
dev.off()
