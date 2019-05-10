# Population
windows(width = 8, height = 4.5)
par(mfrow = c(1, 1))

x <- rnorm(1000000, mean = 5, sd = 3)

hist(x)

dev.copy2pdf(file = 'plots/se-population.pdf')

# Distribution of the means: 100 samples of size 50
windows(width = 8, height = 4.5)

m <- numeric()

for (i in 1:1000) {
  m <- c(m, mean(sample(x, size = 50)))
}

barx = expression(bar(x))
hist(m, main = "Distribution of means (sample size = 50)", xlab = barx)

dev.copy2pdf(file = 'plots/se-sampling-distribution-50.pdf')

# Distribution of the means depending on the sample size
windows(width = 8, height = 4.5)
par(mfrow = c(1, 3), oma = c(0, 0, 2, 0))

n <- 100

m <- data.frame(
  s10 = numeric(length = n),
  s100 = numeric(length = n),
  s1000 = numeric(length = n)
)

for (i in 1:n) {
  m$s10[i] <- mean(sample(x, size = 10))
  m$s100[i] <- mean(sample(x, size = 100))
  m$s1000[i] <- mean(sample(x, size = 1000))
}

hist(m$s10, xlim = c(2, 8), main = "Sample size = 10", xlab = barx)
hist(m$s100, xlim = c(2, 8), main = "Sample size = 100", xlab = barx)
hist(m$s1000, xlim = c(2, 8), main= "Sample size = 1000", xlab = barx)
title(main = "Sampling distribution of the mean (100 samples)", outer = TRUE)

dev.copy2pdf(file = "plots/se-sampling-distribution-10-100-1000.pdf")

windows(width = 8, height = 3.5)
par(mfrow = c(1, 1), mar = c(4, 4, 1, 1), oma = c(0, 0, 0, 0))
boxplot(m, names = c("sample=10", "sample=100", "sample=1000"))
dev.copy2pdf(file = "plots/se-sampling-distribution-boxplot.pdf")