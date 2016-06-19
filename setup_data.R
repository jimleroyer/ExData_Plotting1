
### General R Configuration
options(stringsAsFactors=FALSE)

### Utility functions

download_unzip <- function(url, zip_directory, zip_file) {
  dir.create(file.path(zip_directory), showWarnings = FALSE)
  ziploc <- paste(zip_directory, zip_file, sep = "/")
  if (!file.exists(ziploc)) {
    download.file(url, ziploc, method = "curl")
    unzip(ziploc, exdir = zip_directory, overwrite = F)
  }
}

install_deps <- function(...) {
  deps <- unlist(list(...))
  new.packages <- deps[!(deps %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
}

### Dependencies

install_deps("lubridate", "dplyr")
library(lubridate)
library(dplyr)

### Getting data

# Download & extract data if not existing in workspace
zip_file <- "https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip"
download_unzip(zip_file, "data", "household_power_consumptions.zip")

### Reading data
consumptions <- read.table(
  "data/household_power_consumption.txt", 
  sep = ";",
  header = TRUE,
  na.strings = "?"
)

# Converting columns to proper classes
consumptions$DateTime <- dmy_hms(paste(consumptions$Date, consumptions$Time))
consumptions$Date <- dmy(consumptions$Date)
consumptions$Time <- hms(consumptions$Time)

# Filter the data between 2007-02-01 and 2007-02-02 (included)
date_from <- ymd("2007-02-01")
date_to <- ymd("2007-02-02")
consumptions <- consumptions %>% filter(Date >= date_from & Date <= date_to)
