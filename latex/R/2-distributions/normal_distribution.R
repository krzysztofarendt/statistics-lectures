# Binomial distribution

library("RColorBrewer")
colors <- brewer.pal(n = 3, name = "Set1")

windows(width = 8, height = 4)

X <- seq(-5, 5, by = 0.1)
sd <- c(0.5, 1, 2)

pdf1 <- dnorm(X, mean = 0, sd = sd[1])
cdf1 <- pnorm(X, mean = 0, sd = sd[1])

pdf2 <- dnorm(X, mean = 0, sd = sd[2])
cdf2 <- pnorm(X, mean = 0, sd = sd[2])

pdf3 <- dnorm(X, mean = 0, sd = sd[3])
cdf3 <- pnorm(X, mean = 0, sd = sd[3])

par(mfrow = c(1, 2))

plot(X, pdf1, col = colors[1], ylab = "PDF", xlab = "X", pch = 0, type="l",
     ylim=c(0, 1), lwd=2)
lines(X, pdf2, col = colors[2], type = "l", pch = 0, lty = 2, lwd = 2)
lines(X, pdf3, col = colors[3], type = "l", pch = 0, lty = 4, lwd = 2)

legend("topright", legend=c("SD=0.5", "SD=1.0", "SD=2.0"),
       col = colors[1:3], bty = "n", lty = c(1, 2, 4), lwd = 2)

plot(X, cdf1, col = colors[1], ylab = "CDF", xlab = "X", pch = 0, type="l",
     ylim=c(0, 1), lwd = 2)
lines(X, cdf2, col = colors[2], type = "l", pch = 0, lty = 2, lwd = 2)
lines(X, cdf3, col = colors[3], type = "l", pch = 0, lty = 4, lwd = 2)

legend("bottomright", legend=c("SD=0.5", "SD=1.0", "SD=2.0"),
       col = colors[1:3], bty = "n", lty = c(1, 2, 4), lwd = 2)

dev.copy2pdf(file = "plots/normal-distribution.pdf")