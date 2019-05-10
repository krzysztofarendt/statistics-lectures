# This script shows how point estimates for mean and SD change
# with the sample size

# 1) Samples increased incrementally
m <- numeric()
s <- numeric()
x <- rnorm(1, mean = 0, sd = 10)

for (i in 2:1000) {
  
  x <- c(x, rnorm(1, mean = 0, sd = 10))
  m <- c(m, mean(x))
  s <- c(s, sd(x))
}

windows(width = 8, height = 3)
par(mfrow=c(1, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))

plot(m, type = 'l', ylab = "Mean", xlab = "Sample size")
plot(s, type = 'l', ylab = "SD", xlab = "Sample size")
title(main = "Samples increased incrementally", outer = TRUE)

dev.copy2pdf(file = "plots/point-estimate-vs-sample-size1.pdf")

# 2) Samples drawn independently
m <- numeric()
s <- numeric()

for (i in 2:1000) {
  x <- rnorm(i, mean = 0, sd = 10)
  
  m <- c(m, mean(x))
  s <- c(s, sd(x))
}

windows(width = 8, height = 3)
par(mfrow=c(1, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))

plot(m, type = 'l', ylab = "Mean", xlab = "Sample size")
plot(s, type = 'l', ylab = "SD", xlab = "Sample size")
title(main = "Samples drawn independently", outer = TRUE)

dev.copy2pdf(file = "plots/point-estimate-vs-sample-size2.pdf")
