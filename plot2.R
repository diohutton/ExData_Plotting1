# Function to create a line plot of Global Active Power from the Household Power Consumption data file
# and store it to a png file
plot2 <- function () {

  #helper function to calculate rows to read from file source
  source("calculateSkipRows.R")
  num_skip_rows <- calculateSkipRows()
  #variable header names
  var_names <- c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity",
                 "kitchenMeter", "laundryMeter", "heatingMeter")
  #Using number of calculated skip rows, pull two days worth of data at 1440 rows per day from the file
  data_set <- read.table("household_power_consumption.txt", skip = num_skip_rows, nrows = 2880, 
                         na.strings = "?", sep=";", col.names = var_names)
  #pull variable for graph
  global_power <- as.numeric(data_set$globalActivePower)
  #use lubridate function to combine date and time columns
  date_time = dmy_hms(paste(data_set$date, data_set$time))
  #open png device
  png("plot2.png", width=480, height=480)
  #plot graph
  plot(date_time, global_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  #close png device
  dev.off()
}




