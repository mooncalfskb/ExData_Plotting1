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


#view it on screen
dev.off(dev.list()["RStudioGD"])
dev.set(2)
dev.cur()
#plot(feb$DateTime, type="n")
#overlay plots and set y axis
plot(feb$DateTime,feb$Sub_metering_1, type="l", col="black", ylim=c(0,38), xlab="", ylab="Energy Sub metering")
legend("topright", c("Sub_meterinc("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2.5,2.5,2.5),col=c("black","red","blue"), cex=1) eft", legend=legtext,col=col,text.col=col,lwd=lwd,lty=lty,cex=1.1,ncol=3,title = "Horizons",title.col ="black",title.cex=1.4)
par(new=TRUE)
plot(feb$DateTime,feb$Sub_metering_2, type="l", col="red",  ylim=c(0,38), xlab="", ylab="")
par(new=TRUE)
plot(feb$DateTime,feb$Sub_metering_3, type="l", col="blue",  ylim=c(0,38), xlab="", ylab="")
par()
#dev.off#write to png
# dev.off(dev.list()["RStudioGD"])
# png("/Users/mooncalf/Dropbox/skb/coursera/ExData_Plotting1/plot2.png", width=480, height=480)
# #set up plot, make fonts smaller, x, y labels
# plot(feb$DateTime,feb$Global_active_power,type="n", xlab="", ylab="Global Active Power (kilowatts)",cex.lab=.75, ine
# lines(feb$DateTime,feb$Global_active_power)
# dev.off()



