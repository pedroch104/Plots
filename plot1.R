
##data should be in your working directory
data<-read.table("household_power_consumption.txt",header=TRUE, sep= ";", na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

##condition for dsubset the wanted data
data<-data [ ifelse (data$Date=="2007-02-01" | data$Date=="2007-02-02" ,TRUE,FALSE) ,]

#pasting the data and the time
data$date_time<-with(data, paste(Date, Time, sep = " ")) 
data$date_time<-strptime(data$date_time,format= "%Y-%m-%d %H:%M:%S")

#Plot#1
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.copy(png,'plot1.png')
dev.off()
