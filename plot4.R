setwd("~/R/exploratory_data_analysis")
dados<-read.table('data/household_power_consumption.txt', header=TRUE, sep = ";", na.strings = "?")
data_hora<-paste(dados$Date, dados$Time, sep = " ")
dados$Date<-strptime(data_hora, format = "%d/%m/%Y %H:%M:%S")
dados$Time<-NULL
d1<-strptime("2007-02-01", format = "%Y-%m-%d")
d2<-strptime("2007-02-03", format = "%Y-%m-%d")
dados<-dados[dados$Date>=d1 & dados$Date <=d2 , ]
par(mfcol=c(2,2))
plot(dados$Global_active_power, type = "l", xaxt="n", ylab = "Global Active Power", xlab = "")
axis(1,at=c(1,1+1440,2881), labels = c("Thu","Fri","Sat"))


plot(dados$Sub_metering_1, type = "n", xaxt="n", ylab = "Energy sub metering", xlab = "")
#plot(, type = "l", col="red", xaxt="n", ylab = "", xlab = "", ylim=c(0,40))
lines(dados$Sub_metering_1,col="black",xaxt="n", xlab="")
lines(dados$Sub_metering_2,col="red",xaxt="n", xlab="")
lines(dados$Sub_metering_3,col="blue",xaxt="n", xlab="")
axis(1,at=c(1,1+1440,2881), labels = c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), bty="n")

plot(dados$Voltage, type="l", xaxt="n", ylab="Voltage", xlab="datetime")
axis(1,at=c(1,1+1440,2881), labels = c("Thu","Fri","Sat"))

plot(dados$Global_reactive_power, type="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(1,at=c(1,1+1440,2881), labels = c("Thu","Fri","Sat"))