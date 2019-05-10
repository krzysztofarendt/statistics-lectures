# Poisson distribution

library("RColorBrewer")
colors <- brewer.pal(n = 3, name = "Set1")

windows(width = 8, height = 5)

X <- 0:20
lam <- c(1, 5, 10)

lam.str <- c(
  expression(paste(lambda, "=1")),
  expression(paste(lambda, "=5")),
  expression(paste(lambda, "=10"))
)


pdf1 <- dpois(X, lambda = lam[1])
cdf1 <- ppois(X, lambda = lam[1])

pdf2 <- dpois(X, lambda = lam[2])
cdf2 <- ppois(X, lambda = lam[2])

pdf3 <- dpois(X, lambda = lam[3])
cdf3 <- ppois(X, lambda = lam[3])

par(mfrow = c(1, 2), xpd = TRUE, mar = c(5, 5, 3, 1.5))

plot(pdf1, col = colors[1], ylab = "PMF", xlab = "X", pch = 0, type = "b")
lines(pdf2, col = colors[2], type = "b", pch = 0)
lines(pdf3, col = colors[3], type = "b", pch = 0)

legend("top", legend=lam.str,
       col = colors[1:3], pch = 0, inset = -0.1,
       ncol = 3, bty = "n")

plot(cdf1, col = colors[1], ylab = "CDF", xlab = "X", pch = 0, type = "b", ylim = c(0, 1))
lines(cdf2, col = colors[2], type = "b", pch = 0)
lines(cdf3, col = colors[3], type = "b", pch = 0)

legend("top", legend=lam.str,
       col = colors[1:3], pch = 0, inset = -0.1,
       ncol = 3, bty = "n")

dev.copy2pdf(file = "plots/poisson-distribution.pdf")