source("setup_data.R")

### Configure graphic device

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, type = c("cairo", "cairo-png", "Xlib", "quartz"))

### Draw graphs

hist(consumptions$Global_active_power, 
     main = "Global Active Power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"
)

### Flush PNG device to disk
dev.off()
