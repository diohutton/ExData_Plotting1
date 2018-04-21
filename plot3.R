# Function to create line plots of three metering variables from the Household Power Consumption data file
# and store it to a png file
plot3 <- function () {
  
  #helper function to calculate rows to read from file source
  source("calculateSkipRows.R")
  num_skip_rows <- calculateSkipRows()
  #variable header names
  var_names <- c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity",
                 "kitchenMeter", "laundryMeter", "heatingMeter")
  #Using number of calculated skip rows, pull two days worth of data at 1440 rows per day from the file
  data_set <- read.table("household_power_consumption.txt", skip = num_skip_rows, nrows = 2880, 
                         na.strings = "?", sep=";", col.names = var_names)
  #pull metering variables for graph
  meter_1 <- as.numeric(data_set$kitchenMeter);
  meter_2 <- as.numeric(data_set$laundryMeter);
  meter_3 <- as.numeric(data_set$heatingMeter);
  
  #use lubridate function to combine date and time columns
  date_time = dmy_hms(paste(data_set$date, data_set$time))
  #open png device
  png("plot3.png", width=480, height=480)
  #plot graph and add annotations
  plot(date_time, meter_1, type="l", xlab="", ylab="Energy sub metering")
  lines(date_time, meter_2, type="l", col="red")
  lines(date_time, meter_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
  #close png device
  dev.off()
}



