data <- read.table('household_power_consumption.txt', header = T, sep=";")

data$CorrectedTime <- as.POSIXct(paste(data[,'Date'], data[,'Time']), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")

with(data,{plot(CorrectedTime, Global_active_power, type = "n", ylab= "Global Active Power (kilowatts)", xlab = "")
           lines(CorrectedTime, Global_active_power)
          })
dev.off()

