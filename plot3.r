
if(!exists("load.household_power_consumption", mode = "function"))
	source("load.household_power_consumption.r")


DF.feb <- load.household_power_consumption()

# My computer has locale "Russian_Russia.1251"
# change locale to "English_United States.1252" for days of week in English
Sys.setlocale("LC_TIME", "English_United States.1252")


#Construct the 3'th plot
png("plot3.png") #comment to use screen device!
with( DF.feb, {	plot(Datetime, Sub_metering_1, xlab = NA, ylab = "Energy sub metering", type = "n");
		points(Datetime, Sub_metering_1, 
			col = "black",
			type = "l");
		points(Datetime, Sub_metering_2, 
			col = "red",
			type = "l")
		points(Datetime, Sub_metering_3, 
			col = "blue",
			type = "l");
		legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
		})

# Save to the file
#dev.copy( device = png, filename = "plot3.png")
dev.off()
