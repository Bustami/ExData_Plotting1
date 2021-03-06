data<-read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)
data2<-subset(data,grepl("^1/2/2007|^2/2/2007",data$Date))
x<-strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")
data2[,3]<-as.numeric(data2[,3])
plot(x,data2$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
