# Helper function that uses lubridate to calculate the number of minutes (aka rows to skip) 
# when reading the Household Power Consumption data file
# first line of the file 12-16-2006:17:24 and the last date to skip 01-31-2007:23:59
# prerequisites for this function is to install lubridate
#install.packages("lubridate")
#library(lubridate)
calculateSkipRows <- function () {
  date1 <- as.POSIXlt('2006-12-16T17:24:00',format="%Y-%m-%dT%H:%M:%S")
  date2 <- as.POSIXlt('2007-01-31T23:59:00',format="%Y-%m-%dT%H:%M:%S")
  num_skip_rows <- as.numeric(difftime(date2,date1,units="mins") + 2)
  return(num_skip_rows)
}