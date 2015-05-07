
if(!exists("load.household_power_consumption", mode = "function"))
	source("load.household_power_consumption.r")


DF.feb <- load.household_power_consumption()

# My computer has locale "Russian_Russia.1251"
# change locale to "English_United States.1252" for days of week on English
Sys.setlocale("LC_TIME", "English_United States.1252")


#Construct the 4'th plot
par( mfrow = c(2,2))
with( DF.feb, {	plot(Datetime, Global_active_power, xlab = NA, ylab = "Global Active Power", type = "l");
		plot(Datetime, Voltage, xlab = "datetime", type = "l");
		plot(Datetime, Sub_metering_1, xlab = NA, ylab = "Energy sub metering", type = "n");
		points(Datetime, Sub_metering_1, 
			col = "black",
			type = "l");
		points(Datetime, Sub_metering_2, 
			col = "red",
			type = "l")
		points(Datetime, Sub_metering_3, 
			col = "blue",
			type = "l");
		legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, bty = "n")
		plot(Datetime, Global_reactive_power, xlab = "datetime", type = "l");
		})
par( mfrow = c(1,1))

# Save to the file
dev.copy( device = png, filename = "plot4.png")
dev.off()

