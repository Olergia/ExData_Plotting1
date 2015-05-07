
if(!exists("load.household_power_consumption", mode = "function"))
	source("load.household_power_consumption.r")


DF.feb <- load.household_power_consumption()

# My computer has locale "Russian_Russia.1251"
# change locale to "English_United States.1252" for days of week on English
Sys.setlocale("LC_TIME", "English_United States.1252")


#Construct the first plot
with( DF.feb, hist(Global_active_power, col = "red",
		  main = "Global Active Power",
		  xlab = "Global Active Power (kilowatts)"))
# Save to the file
dev.copy( device = png, filename = "plot1.png")
dev.off()



