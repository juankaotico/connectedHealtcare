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






