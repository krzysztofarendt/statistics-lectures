# This script presents how standard deviation affects the normal distribution
# and what is the standard deviation for different data sets

library("RColorBrewer")
colors <- brewer.pal(n = 5, name = "Set1")

windows(width = 8, height = 5)

par(mfrow = c(1, 2))

# Plot 1
x <- seq(0, 10, 0.1)
y0 <- dnorm(x, mean = 5, sd = 0.5)
y1 <- dnorm(x, mean = 5, sd = 1)
y2 <- dnorm(x, mean = 5, sd = 2)

plot(x, y0, type = "l", col = colors[1], ylab = "PDF", xlab = "X",
     lty = 1, lwd = 2, ylim = c(0, 1))
lines(x, y1, col = colors[2], lty = 2, lwd = 2)
lines(x, y2, col = colors[3], lty = 4, lwd = 2)

legend("topright", legend = c("SD=0.5", "SD=1.0", "SD=2.0"),
       col = colors[1:3], lty = c(1, 2, 4), lwd = 2)

# Plot 2
plot(rnorm(100, mean = 5, sd = 0.5), col = colors[1], ylim = c (0, 10), pch = 2,
     ylab = "X", xlab = "Observation")
lines(rnorm(100, mean = 5, sd = 1), col = colors[2], type = "p", pch = 3)
lines(rnorm(100, mean = 5, sd = 2), col = colors[3], type = "p", pch = 4)

legend("topright", legend = c("SD=0.5", "SD=1.0", "SD=2.0"), col = colors[1:3],
       pch = 2:4, bg = "white")

dev.copy2pdf(file="plots/SD.pdf")