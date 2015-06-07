datafile<-"data/household_power_consumption.txt"
data<-read.table(datafile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec = ".")
subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactive<-as.numeric(subset$Global_active_power)
submeter1<-as.numeric(subset$Sub_metering_1)
submeter2<-as.numeric(subset$Sub_metering_2)
submeter3<-as.numeric(subset$Sub_metering_3)
png("plot3.png",height=480,width=480)
plot(datetime,submeter1,col="red",type="l",ylab = "Energy Submetering",xlab="")
lines(datetime,submeter2,type="l",col="red")
lines(datetime,submeter3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()