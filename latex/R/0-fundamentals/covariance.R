# Plots different data sets and calculates the covariance

X <- 1:50

Y1 <- 0.5 * X + 15
Y2 <- 1.0 * X + 5
Y3 <- -0.3 * X + 30
Y4 <- rep(25, times = length(X))

Y1 <- Y1 + rnorm(length(X), sd = 3)
Y2 <- Y2 + rnorm(length(X), sd = 2)
Y3 <- Y3 + rnorm(length(X), sd = 1)
Y4 <- Y4 + rnorm(length(X), sd = 4)

cov1 = cov(Y1, Y1)
cov2 = cov(Y1, Y2)
cov3 = cov(Y1, Y3)
cov4 = cov(Y1, Y4)

windows(width = 8, height = 3)

par(mfrow = c(1, 4))

title1 = sprintf("cov(Y1, Y1) = %0.2f", cov1)
title2 = sprintf("cov(Y1, Y2) = %0.2f", cov2)
title3 = sprintf("cov(Y1, Y3) = %0.2f", cov3)
title4 = sprintf("cov(Y1, Y4) = %0.2f", cov4)

plot(X, Y1, ylim = c(0, 50), xlim = c(0, 50), pch = 2, main = title1)
plot(X, Y2, ylim = c(0, 50), xlim = c(0, 50), pch = 2, main = title2)
plot(X, Y3, ylim = c(0, 50), xlim = c(0, 50), pch = 2, main = title3)
plot(X, Y4, ylim = c(0, 50), xlim = c(0, 50), pch = 2, main = title4)

dev.copy2pdf(file="plots/covariance.pdf")