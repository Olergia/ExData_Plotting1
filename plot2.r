
if(!exists("load.household_power_consumption", mode = "function"))
	source("load.household_power_consumption.r")


DF.feb <- load.household_power_consumption()

# My computer has locale "Russian_Russia.1251"
# change locale to "English_United States.1252" for days of week in English
Sys.setlocale("LC_TIME", "English_United States.1252")


#Construct the 2'nd plot
png("plot2.png") #comment to use screen device!
with( DF.feb, plot(Datetime, Global_active_power, 
		  main = NULL,
		  xlab = NA,
		  ylab = "Global Active Power (kilowatts)", type = "l"))

# Save to the file
#dev.copy( device = png, filename = "plot2.png")
dev.off()


