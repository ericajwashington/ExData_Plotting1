#  Making Plots Assignment - Data Science - Course 4 Week 1

## 1. Set working directory to E:\DataScienceCoursera\4_Exploratory Data Analysis\Week 1\Project.
getwd() #confirmed

## 2. Fork and clone the following repo -- https://github.com/rdpeng/ExData_Plotting1.
## 3. According to the instructions, you'll need to save each graph as a PNG.

## Plot 1
#Reading, naming and subsetting power consumption data
power <- read.table("power.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)

dev.copy(png,file="plot1.png")
dev.off()