datafile<-"data/household_power_consumption.txt"
data<-read.table(datafile,header=TRUE,sep=";",stringsAsFactors = FALSE,dec = ".")
subset<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactive<-as.numeric(subset$Global_active_power)
png("plot2.png",height=480,width=480)
plot(globalactive,datetime,col="red",type="l",main="Global Active Power",xlab = "Global Active Power(killowats)")
dev.off()