# Binomial distribution

library("RColorBrewer")
colors <- brewer.pal(n = 3, name = "Set1")

windows(width = 8, height = 4)

X <- 0:10
p <- c(0.25, 0.5, 0.75)

pdf1 <- dgeom(X, prob = p[1])
cdf1 <- pgeom(X, prob = p[1])

pdf2 <- dgeom(X, prob = p[2])
cdf2 <- pgeom(X, prob = p[2])

pdf3 <- dgeom(X, prob = p[3])
cdf3 <- pgeom(X, prob = p[3])

par(mfrow = c(1, 2), xpd = TRUE, mar = c(5, 5, 3, 1.5))

plot(X, pdf1, col = colors[1], ylab = "PMF", xlab = "X", pch = 0, type="b", ylim=c(0, 1))
# axis(1, at = seq(0, 10, by = 2), labels = seq(0, 10, by = 2))
lines(X, pdf2, col = colors[2], type = "b", pch = 0)
lines(X, pdf3, col = colors[3], type = "b", pch = 0)

legend("top", legend=c("p=0.25", "p=0.50", "p=0.75"),
       col = colors[1:3], pch = 0, inset = -0.15,
       ncol = 3, bty = "n")

plot(X, cdf1, col = colors[1], ylab = "CDF", xlab = "X", pch = 0, type="b", ylim=c(0, 1))
lines(X, cdf2, col = colors[2], type = "b", pch = 0)
lines(X, cdf3, col = colors[3], type = "b", pch = 0)

legend("top", legend=c("p=0.25", "p=0.50", "p=0.75"),
       col = colors[1:3], pch = 0, inset = -0.15,
       ncol = 3, bty = "n")

dev.copy2pdf(file = "plots/geometric-distribution.pdf")