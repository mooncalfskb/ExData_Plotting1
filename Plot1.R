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
hist(feb$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")

#write to png
dev.off(dev.list()["RStudioGD"])
png("Plot1.png", wi/Users/mooncalf/Dropbox/skb/coursera/ExData_Plotting1/pUsers/mooncalght = 480)
hist(feb$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



