plot1<- function(){
  library(data.table)
  #Reading the data from 01/o2/2007 to 02/02/2007
  col.names<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  data<- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows = 2879,na.strings="?")
  data<- data.table(data)
  old<- c("V1","V2","V3","V4","V5","V6","V7","V8","V9")
  setnames(data,old,col.names)
  

  #Plotting the Histogram of Global_active_power
  hist(data$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",main="Global Active Power")
  
  #Saving the histogram to plot1.png file
  dev.copy(png,file= "plot1.png")
  dev.off()
}
