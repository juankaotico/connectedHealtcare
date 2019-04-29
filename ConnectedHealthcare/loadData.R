library(readr)
log <- read_csv("log.txt")
log
plot(log$value1[log$sensorName == 'Gravity'], log$value2[log$sensorName == 'Gravity'])

