setwd("C:/Users/212312659/Desktop/Utility/Essentials/Coursera/Exploratory Data Analysis/Project 1")

# supress all warnings
options(warn=-1)

# reading specific two days data from file
fh<-file("household_power_consumption.txt","r");
data <- read.table(text = grep("^[1,2]/2/2007",readLines(fh),value=TRUE) )
data <- data.frame(data)

# splitting string into columns - copying to tmp
tmp <- matrix(unlist(strsplit(as.character(data$V1), ';')), ncol=9, byrow=TRUE)

# Create a temp variable of date and time
tmp[,2] <- paste(tmp[,1],tmp[,2])

#plotting to a png file
png(filename = "plot2.png",width = 480, height = 480)

plot(tmp[,3], ylab = "Global Active Power (kilowatts)", type = "l")
#at = format(data[,2], '%h/%m/%s') %in% c('00:00:00')
#axis(side=1, at=a[ at ], labels=format(data[,1], '%ddd'))

dev.off()

