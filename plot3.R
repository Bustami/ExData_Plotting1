data<-read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors = FALSE)
data2<-subset(data,grepl("^1/2/2007|^2/2/2007",data$Date))
x<-strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")
data2[,7]<-as.numeric(data2[,7])
data2[,8]<-as.numeric(data2[,8])

with(data2, plot(x, Sub_metering_1, type = "n", xlab="",ylab=""))
with(data2, lines(x, Sub_metering_1, col = "black"))
with(data2, lines(x, Sub_metering_2, col = "red"))
with(data2, lines(x, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))

dev.copy(png, file = "plot3.png")
dev.off()
