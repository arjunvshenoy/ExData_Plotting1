setwd("C:/Users/212312659/Desktop/Utility/Essentials/Coursera/Exploratory Data Analysis/Project 1")

# supress all warnings
options(warn=-1)

# reading specific two days data from file
fh<-file("household_power_consumption.txt","r");
data <- read.table(text = grep("^[1,2]/2/2007",readLines(fh),value=TRUE) )
data <- data.frame(data)

# splitting string into columns - copying to tmp
tmp <- matrix(unlist(strsplit(as.character(data$V1), ';')), ncol=9, byrow=TRUE)

#plotting to a png file
png(filename = "plot3.png",width = 480, height = 480)

# Set xaxis as per day
dateTime   <- as.POSIXlt(paste(as.Date(tmp[,1], format="%d/%m/%Y"), tmp[,2], sep=" "))

#Plot
plot(dateTime, tmp[,7], xlab="", ylab = "Energy sub metering", type = "l", col = "black", ylim = c(0,40))
par(new = T)
plot(dateTime, tmp[,8], type = "l", col = "red", xlab="", ylab ="", ylim = c(0,40), axes = F)
par(new = T)
plot(dateTime, tmp[,9], type = "l", col = "blue", xlab="", ylab ="", ylim = c(0,40), axes = F)
par(new = F)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))

dev.off()

