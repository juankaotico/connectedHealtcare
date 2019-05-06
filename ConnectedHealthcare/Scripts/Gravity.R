library(readr)
log <- read_csv("Scripts/log.txt")
sensor_name <- "Gravity"
plot(log$value1[log$sensorName == sensor_name], ylab = sensor_name)
lines(log$value2[log$sensorName == sensor_name], type='l', col="red")
lines(log$value3[log$sensorName == sensor_name], type='l', col="blue")
legend("topleft", c("value1", "value2", "value3"), col = c("black", "red", "blue"), lty = 1, cex = 0.8)
