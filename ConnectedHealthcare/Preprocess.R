#Load Data

sitData <- read.table("./FirstTest.txt", header = TRUE, sep="|")
head(sitData)

#Rename Labels
sitData$statusId <-factor(sitData$statusId, labels=c("sitting straight","sitting forward","sitting backwards","rightside","leftside"))
head(sitData)
summary(sitData$statusId)

#Attach Main Data Set, so that the variables could be addressed directly
attach(sitData)

# calculate the Magnitude 
sitData$magnitude=sqrt(x^2+y^2+z^2)
summary(statusId)

#Creating Subsets:
sub_sitting_straight <- subset(sitData, statusId=="sitting straight")
sub_sitting_forward <- subset(sitData, statusId=="sitting forward")
sub_sitting_backwards <- subset(sitData, statusId=="sitting backwards")
sub_rightside <- subset(sitData, statusId=="rightside")
sub_leftside <- subset(sitData, statusId=="leftside")

#Cleaning Time: 
mt <- min(sub_sitting_straight$timestamp)
sub_sitting_straight$timestamp <- (sub_sitting_straight$timestamp -mt)

mt <- min(sub_sitting_forward$timestamp)
sub_sitting_forward$timestamp <- (sub_sitting_forward$timestamp -mt)

mt <- min(sub_sitting_backwards$timestamp)
sub_sitting_backwards$timestamp <- (sub_sitting_backwards$timestamp -mt)

mt <- min(sub_leftside$timestamp)
sub_leftside$timestamp <- (sub_leftside$timestamp -mt)

mt <- min(sub_rightside$timestamp)
sub_rightside$timestamp <- (sub_rightside$timestamp -mt)

sensor_name <- "3-axis Accelerometer"
plot(sub_sitting_straight$x[sub_sitting_straight$sensorName == sensor_name], ylab = paste(sensor_name, "X", sep= " "), ylim = c(-10, 10))
lines(sub_sitting_forward$x[sub_sitting_forward$sensorName == sensor_name], type='l', col="red")
lines(sub_sitting_backwards$x[sub_sitting_backwards$sensorName == sensor_name], type='l', col="blue")
lines(sub_leftside$x[sub_leftside$sensorName == sensor_name], type='l', col="green")
lines(sub_rightside$x[sub_rightside$sensorName == sensor_name], type='l', col="yellow")
legend("topleft", c("straight", "forward", "backward", "leftside", "rightside"), col = c("black", "red", "blue", "green", "yellow"), lty = 1, cex = 0.8)


plot(sub_sitting_straight$y[sub_sitting_straight$sensorName == sensor_name], ylab = paste(sensor_name, "Y", sep= " "), ylim = c(-20, 20))
lines(sub_sitting_forward$y[sub_sitting_forward$sensorName == sensor_name], type='l', col="red")
lines(sub_sitting_backwards$y[sub_sitting_backwards$sensorName == sensor_name], type='l', col="blue")
lines(sub_leftside$x[sub_leftside$sensorName == sensor_name], type='l', col="green")
lines(sub_rightside$x[sub_rightside$sensorName == sensor_name], type='l', col="yellow")
legend("topleft", c("straight", "forward", "backward", "leftside", "rightside"), col = c("black", "red", "blue", "green", "yellow"), lty = 1, cex = 0.8)


plot(sub_sitting_straight$z[sub_sitting_straight$sensorName == sensor_name], ylab = paste(sensor_name, "Z", sep= " "), ylim = c(-10, 10))
lines(sub_sitting_forward$z[sub_sitting_forward$sensorName == sensor_name], type='l', col="red")
lines(sub_sitting_backwards$z[sub_sitting_backwards$sensorName == sensor_name], type='l', col="blue")
lines(sub_leftside$x[sub_leftside$sensorName == sensor_name], type='l', col="green")
lines(sub_rightside$x[sub_rightside$sensorName == sensor_name], type='l', col="yellow")
legend("topleft", c("straight", "forward", "backward", "leftside", "rightside"), col = c("black", "red", "blue", "green", "yellow"), lty = 1, cex = 0.8)



