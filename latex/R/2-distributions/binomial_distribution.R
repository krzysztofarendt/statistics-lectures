# Binomial distribution

library("RColorBrewer")
colors <- brewer.pal(n = 3, name = "Set1")

windows(width = 8, height = 5)

X <- 1:100
p <- c(0.25, 0.5, 0.75)

pdf1 <- dbinom(X, size = length(X), prob = p[1])
cdf1 <- pbinom(X, size = length(X), prob = p[1])

pdf2 <- dbinom(X, size = length(X), prob = p[2])
cdf2 <- pbinom(X, size = length(X), prob = p[2])

pdf3 <- dbinom(X, size = length(X), prob = p[3])
cdf3 <- pbinom(X, size = length(X), prob = p[3])

par(mfrow = c(1, 2), xpd = TRUE, mar = c(5, 5, 3, 1.5))

plot(pdf1, col = colors[1], ylab = "PMF", xlab = "X", pch = 0, type = "b")
lines(pdf2, col = colors[2], type = "b", pch = 0)
lines(pdf3, col = colors[3], type = "b", pch = 0)

legend("top", legend=c("p=0.25", "p=0.50", "p=0.75"),
       col = colors[1:3], pch = 0, inset = -0.1,
       ncol = 3, bty = "n")

plot(cdf1, col = colors[1], ylab = "CDF", xlab = "X", pch = 0, type = "b")
lines(cdf2, col = colors[2], type = "b", pch = 0)
lines(cdf3, col = colors[3], type = "b", pch = 0)

legend("top", legend=c("p=0.25", "p=0.50", "p=0.75"),
       col = colors[1:3], pch = 0, inset = -0.1,
       ncol = 3, bty = "n")

dev.copy2pdf(file = "plots/binomial-distribution.pdf")