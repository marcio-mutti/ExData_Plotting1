setwd("~/R/exploratory_data_analysis")
dados<-read.table('data/household_power_consumption.txt', header=TRUE, sep = ";", na.strings = "?")
data_hora<-paste(dados$Date, dados$Time, sep = " ")
dados$Date<-strptime(data_hora, format = "%d/%m/%Y %H:%M:%S")
dados$Time<-NULL
d1<-strptime("2007-02-01", format = "%Y-%m-%d")
d2<-strptime("2007-02-03", format = "%Y-%m-%d")
dados<-dados[dados$Date>=d1 & dados$Date <=d2 , ]
png(filename = "plot2.png")
plot(dados$Global_active_power, type = "l", xaxt="n", ylab = "Global Active Power (killowatts)", xlab = )
axis(1,at=c(1,1+1440,2881), labels = c("Thu","Fri","Sat"))
dev.off()
