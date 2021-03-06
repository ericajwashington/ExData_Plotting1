#  Making Plots Assignment - Data Science - Course 4 Week 1

## 1. Set working directory to E:\DataScienceCoursera\4_Exploratory Data Analysis\Week 1\Project.
getwd() #confirmed

## 2. Fork and clone the following repo -- https://github.com/rdpeng/ExData_Plotting1.
## 3. According to the instructions, you'll need to save each graph as a PNG.

## Plot 2
# Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

### Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


### calling the basic plot function
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

### annotating graph
title(main="Global Active Power Vs Time")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)

dev.copy(png,file="plot2.png")
dev.off()