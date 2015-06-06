plot4<- function(){
  #Reading the data from 01/o2/2007 to 02/02/2007
  col.names<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  data<- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows = 2879,na.strings="?")
  data<- data.table(data)
  old<- c("V1","V2","V3","V4","V5","V6","V7","V8","V9")
  setnames(data,old,col.names)
  
  z1<- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
  z<- as.Date(z1)
  
  #Plotting the graph 
  par(mfrow=c(2,2))
  par(mar=c(4,4,2,2))
  with(data,plot(z1,Global_active_power,type="l",xlab="DateTime"))
  
  with(data,plot(z1,Voltage,type="l",xlab="DateTime"))
  
  y<- select(data,Sub_metering_1:Sub_metering_3)
  with(data,plot(z1,Sub_metering_1,type="n",ylab="Energy Sub Metering",xlab="DateTime"))
  
  points(z1,y$Sub_metering_1,type="l")
  points(z1,y$Sub_metering_2,col="red",type="l")
  points(z1,y$Sub_metering_3,col="blue",type="l")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),xjust=0.5,col=c("black","red","blue"),lty=1)
  
  with(data,plot(z1,Global_reactive_power,type="l",xlab="DateTime"))
  
  #Saving the graph to plot4.png file
  dev.copy(png,file= "plot4.png")
  dev.off() 
  
  
}
