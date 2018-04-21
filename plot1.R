# Function to create a bar graph of Global Active Power from the Household Power Consumption data file
# and store it to a png file
plot1 <- function () {
  #helper function to calculate rows to read from file source
  source("calculateSkipRows.R")
  num_skip_rows <- calculateSkipRows()
  #variable header names
  var_names <- c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity",
                 "kitchenMeter", "laundryMeter", "heatingMeter")
  #Using number of calculated skip rows, pull two days worth of data (2/1/2007 and 2/2/2007) from the file
  data_set <- read.table("household_power_consumption.txt", skip = num_skip_rows, nrows = 2880, 
                         na.strings = "?", sep=";", col.names = var_names)
  #pull variable for graph
  global_power <- as.numeric(data_set$globalActivePower)
  #open png device
  png("plot1.png", width=480, height=480)
  #plot graph
  hist(global_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  #close png device
  dev.off()
}


