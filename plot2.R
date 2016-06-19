source("setup_data.R")

### Configure graphic device

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, type = c("cairo", "cairo-png", "Xlib", "quartz"))

par(mar=c(4.1, 5.1, 4.1, 4.1))

with(consumptions, plot(
  DateTime, 
  Global_active_power, 
  type = "l",
  ylab = "Global Active Power (kilowatts)",
  xlab = ""
))

### Flush PNG device to disk
dev.off()

