# Plots explaining the fundamental concepts of distributions
# ==========================================================
# 1) Data set
X <- rbeta(1:length(X), shape1 = 3, shape2 = 5) * 60 + 150

hist(X)

windows(width = 8, height = 4)
plot(X, main = "Data Set", pch = 0)
dev.copy2pdf(file = "plots/distrib-data-set.pdf")

# 2) Median
windows(width = 8, height = 4)
medianX <- median(X)
meanX <- mean(X)
plot(X, pch = 0)
abline(h = c(medianX, meanX), col = c("red", "blue"))
legend("topright", legend = c("Median", "Mean"),
       lty = c(1, 1), col = c("red", "blue"), bg = "white")
dev.copy2pdf(file = "plots/distrib-median-vs-mean.pdf")

# 3) Histogram
windows(width = 8, height = 4)
hist(X)
dev.copy2pdf(file = "plots/distrib-histogram.pdf")

# 4) Second histogram
windows(width = 8, height = 5.5)
par(mfrow=c(2, 2))
hist(X, breaks = 3, main = "hist(X, breaks=3)")
hist(X, breaks = 10, main = "hist(X, breaks=10)")
hist(X, breaks = 20, main = "hist(X, breaks=20)")
hist(X, breaks = 40, main = "hist(X, breaks=40)")
dev.copy2pdf(file = "plots/distrib-histogram-bins.pdf")

# 5) Quantiles
print(quantile(X))

# 6) IQR
print(IQR(X))

# 7) PDF vs. CDF
windows(width = 8, height = 5)
par(mfrow = c(1, 2))

plot(density(X), main = "Estimated PDF", xlab = "X")

plot(ecdf(X), main = "Empirical CDF", xlab = "X")

dev.copy2pdf(file = "plots/distrib-pdf-vs-cdf.pdf")