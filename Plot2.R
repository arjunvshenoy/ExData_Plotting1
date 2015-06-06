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
png(filename = "plot2.png",width = 480, height = 480)

# Set xaxis as per day
dateTime   <- as.POSIXlt(paste(as.Date(tmp[,1], format="%d/%m/%Y"), tmp[,2], sep=" "))

#Plot
plot(dateTime, tmp[,3],xlab ="", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()

