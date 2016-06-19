source("setup_data.R")

### Configure graphic device

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, type = c("cairo", "cairo-png", "Xlib", "quartz"))

par(mfrow=c(2, 2), mar=c(4.1, 4.1, 3.1, 3.1), oma=c(1, 1, 0, 0))

### Draw graphs

with(consumptions, plot(
  DateTime, 
  Global_active_power, 
  type = "l",
  ylab = "Global Active Power",
  xlab = ""
))

with(consumptions, plot(
  DateTime, 
  Voltage, 
  type = "l",
  ylab = "Voltage",
  xlab = "datetime"
))

with(consumptions, { 
  plot(
    DateTime, 
    Sub_metering_1, 
    type = "l",
    ylab = "Energy sub metering",
    xlab = ""
  )
  
  lines(
    DateTime,
    Sub_metering_2,
    col = "red"
  )
  
  lines(
    DateTime,
    Sub_metering_3,
    col = "blue"
  )
})

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  lwd = 2,
  bty = "n",
  cex=0.7
)

with(consumptions, plot(
  DateTime, 
  Global_reactive_power, 
  type = "l",
  xlab = "datetime"
))

### Flush PNG device to disk
dev.off()
