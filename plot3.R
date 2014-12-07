##data should be in your working directory
data<-read.table("household_power_consumption.txt",header=TRUE, sep= ";", na.strings="?")
data$Date<-as.Date(data2$Date,"%d/%m/%Y")

##condition for dsubset the wanted data
data<-data [ ifelse (data$Date=="2007-02-01" | data$Date=="2007-02-02" ,TRUE,FALSE) ,]

#pasting the data and the time
data$date_time<-with(data, paste(Date, Time, sep = " ")) 
data$date_time<-strptime(data$date_time,format= "%Y-%m-%d %H:%M:%S")

#plot 3
png(filename="plot3.png")
plot(data$date_time,data$Sub_metering_1,type="l",xlab="",ylab="Energy Sub metering")
lines(data$date_time,data$Sub_metering_2, type="l",col="red")
lines(data$date_time,data$Sub_metering_3, type="l",col="blue")
name<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colors<-c("black","red","blue")
legend("topright", legend=name, col=colors,lty=c(1,1,1))
dev.off()