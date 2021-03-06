plot3<- function(){
  #Reading the data from 01/o2/2007 to 02/02/2007
  col.names<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  data<- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows = 2879,na.strings="?")
  data<- data.table(data)
  old<- c("V1","V2","V3","V4","V5","V6","V7","V8","V9")
  setnames(data,old,col.names)
  
  z1<- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
  z<- as.Date(z1)
  
  #selecting the proper data and replacing the Date and Time column 
  data1<- select(data,Global_active_power:Sub_metering_3)
  data1<- cbind(z,z1,data1)
  group_by(data1,z,z1)
  
  #Plotting the graph b/w Time and Energy subMetering
  y<- select(data1,Sub_metering_1:Sub_metering_3)
  with(data1,plot(z1,Sub_metering_1,type="n",ylab="Energy Sub Metering",xlab=NULL))
  
  points(z1,y$Sub_metering_1,type="l")
  points(z1,y$Sub_metering_2,col="red",type="l")
  points(z1,y$Sub_metering_3,col="blue",type="l")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,box.lwd=2)
  
  #Saving the graph to plot3.png file
  dev.copy(png,file= "plot3.png")
  dev.off()  
}
