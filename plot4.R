data <- read.table('household_power_consumption.txt', header = T, sep=";")

data$CorrectedTime <- as.POSIXct(paste(data[,'Date'], data[,'Time']), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")
with(data,{par(mfrow= c(2,2),mar = c(4, 4, 1, 1))
        plot(CorrectedTime, Global_active_power, type = "n", ylab= "Global Active Power (kilowatts)", xlab = "")
        lines(CorrectedTime, Global_active_power)
        
        plot(CorrectedTime, Voltage,type = "n", xlab = "datetime")
        lines(CorrectedTime, Voltage)
        
        plot(CorrectedTime, Sub_metering_1, type = "n", ylim = c(0,40), ylab= "Energy sub metering", xlab = "")
        lines(CorrectedTime, Sub_metering_1, col = 'black')
        lines(CorrectedTime, Sub_metering_2, col = 'red')
        lines(CorrectedTime, Sub_metering_3, col = 'blue')
        legend("topright", col = c('black','blue','red'), pch = '-', legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'))
        
        plot(CorrectedTime, Global_reactive_power,type = "n", xlab = "datetime")
        lines(CorrectedTime, Global_reactive_power)
})
dev.off()