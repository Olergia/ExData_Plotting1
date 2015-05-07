# multiple read.table's

load.household_power_consumption <- function( fn = "household_power_consumption.txt") { 
	
	require(data.table)

	# read 1st row (DF.row1) 
	DF.row1 <- read.table(fn, header = TRUE, nrow = 1, sep = ";")
	nc <- ncol(DF.row1)

	# Define methods for coercing the Date stored in data-file to Date class; 
	setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

	# read 1st column (DF.Date)
	DF.Date <- read.table(fn, header = TRUE, as.is = TRUE, sep = ";", colClasses = c("myDate", rep("NULL", nc - 1)))

	# Determine the skip and nrow numbers
	from <- which.max(DF.Date$Date >= "2007-02-01")
	to <- which.max(DF.Date$Date >= "2007-02-03")
	rm(DF.Date)

	# Read rows for specific dates
	DF.feb <- read.table(fn, skip = from, nrow = to - from, sep = ";", colClasses = c(rep("character",2), rep("numeric", nc - 2)), na.strings = c("?"))
	colnames(DF.feb) <- colnames(DF.row1)
	rm(DF.row1)

	# union Date & Time columns into new variable 
	DF.feb <- within(DF.feb, Datetime <- as.POSIXlt(paste(Date, Time),
                                          format = "%d/%m/%Y %H:%M:%S"))

	# remove old columns
	DF.feb <- DF.feb[-c(1,2)]
}


