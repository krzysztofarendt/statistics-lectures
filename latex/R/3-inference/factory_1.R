# Factory #1 example

# 95% confidence interval
mu0 <- 3
mus <- 2.8
sds <- 0.9
n <- 100

SE <- sds / sqrt(n)
z95 <- 2
CI <- c(mu0 - z95 * SE, mu0 + z95 * SE)

print("Confidence interval:")
print(CI)

# p-value, alpha = 0.05, double-sided test
SE <- sds / sqrt(n)
Z = (mus - mu0) / SE
print(paste("Z=", Z))

x <- seq(-6, 6, by = 0.001)
y <- dnorm(x)

p = pnorm(Z)
pd = p * 2
print(paste("p-value=", p))
print(paste("p-value(double)=", pd))

windows(width = 8, height = 2)
par(mar = c(4, 4, 1, 1))

plot(x, y, type = 'l', xlab = 'Z', ylab = 'PDF')
abline(v = 0, lty = 2)
abline(v = Z, lty = 2)
text(Z - 1.5, 0.2, paste("Z=", format(round(Z, 2), nsmall = 2)))
arrows(x0 = Z - 0.75, y0 = 0.2, x1 = Z, length = 0.1)
polygon(x = c(Z, x[1], x[x <= Z]),
        y = c(0, 0, y[x <= Z]),
        col = "orange")
polygon(x = c(x[length(x)], -Z, x[x >= -Z]),
        y = c(0, 0, y[x >= -Z]),
        col = "green")

dev.copy2pdf(file = "plots/factory-1-p-value.pdf")