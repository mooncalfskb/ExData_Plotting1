df <- read.csv("/Users/mooncalf/Dropbox/skb/coursera/data/household_power_consumption.txt", sep=";")
#convert the Date and Time variables to Date/Time classes in R using the 𝚜𝚝𝚛𝚙𝚝𝚒𝚖𝚎()  and 𝚊𝚜.𝙳𝚊𝚝𝚎()functions.

#df$Date <- strptime(x = as.character(df$Date), format = "%d/%m/%Y")
# temp column with date time
df$DateTimeTemp <- paste(df$Date,df$Time)
#convert to date time (for some reason required two steps to work)
df$DateTime <- strptime(x = as.character(df$DateTimeTemp), format = "%d/%m/%Y %H:%M:%S")
# drop extra columns
df <- subset(df, select = c("DateTime","Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#2007-02-01 and 2007-02-02
#probably could have subset earlier, but needed to move on.
feb <- subset(df, df$DateTime > "2007-01-31 23:59:59" & df$DateTime < "2007-02-03")
#remove giant dataframe
rm(df)
#show head of feb just to check
head(feb)


dev.off(dev.list()["RStudioGD"])
dev.set(2)
dev.cur()
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#view it on screen
#set up plot, make fonts smaller, x, y labels
plot(feb$DateTime,feb$Global_active_power,type="n", xlab="", ylab="Global Active Power")
lines(feb$DateTime,feb$Global_active_power)

#view it on screen
#set up plot, make fonts smaller, x, y labels
plot(feb$DateTime,feb$Voltage, type="l", xlab="datetime", ylab="Voltage")

#view it on screen
#overlay plots and set y axis
plot(feb$DateTime,feb$Sub_metering_1, type="l", col="black", ylim=c(0,38), xlab="", ylab="Energy Sub metering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n",lwd=c(2.5,2.5,2.5),col=c("black","red","blue"), cex=1) 
par(new=TRUE)
plot(feb$DateTime,feb$Sub_metering_2, type="l", col="red",  ylim=c(0,38), xlab="", ylab="")
par(new=TRUE)
plot(feb$DateTime,feb$Sub_metering_3, type="l", col="blue",  ylim=c(0,38), xlab="", ylab="")
#dev.off()

#view it on screen
#set up plot, make fonts smaller, x, y labels
plot(feb$DateTime,feb$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")









# # #write to png
dev.off(dev.list()["RStudioGD"])
png("/Users/mooncalf/Dropbox/skb/coursera/ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


#view it on screen
#set up plot, make fonts smaller, x, y labels
plot(feb$DateTime,feb$Global_active_power,type="n", xlab="", ylab="Global Active Power")
lines(feb$DateTime,feb$Global_active_power)

#set up plot, make fonts smaller, x, y labels
plot(feb$DateTime,feb$Voltage, type="l", xlab="datetime", ylab="Voltage")

#view it on screen
#overlay plots and set y axis
plot(feb$DateTime,feb$Sub_metering_1, type="l", col="black", ylim=c(0,38), xlab="", ylab="Energy Sub metering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lwd=c(2.5,2.5, 2.5),col=c("black","red","blue"), cex=1) 
par(new=TRUE)
plot(feb$DateTime,feb$Sub_metering_2, type="l", col="red",  ylim=c(0,38), xlab="", ylab="")
par(new=TRUE)
plot(feb$DateTime,feb$Sub_metering_3, type="l", col="blue",  ylim=c(0,38), xlab="", ylab="")
#dev.off()

#view it on screen
#set up plot, make fonts smaller, x, y labels
plot(feb$DateTime,feb$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")




dev.off()
# dev.off()



