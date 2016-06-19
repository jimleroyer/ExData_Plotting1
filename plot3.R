source("setup_data.R")

### Configure graphic device

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA, type = c("cairo", "cairo-png", "Xlib", "quartz"))

par(mar=c(4.1, 5.1, 4.1, 4.1))

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
    #type = "l",
    col = "red"
  )
  
  lines(
    DateTime,
    Sub_metering_3,
    #type = "l",
    col = "blue"
  )
})

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  lwd = 2,
  cex=0.9
)

### Flush PNG device to disk
dev.off()

