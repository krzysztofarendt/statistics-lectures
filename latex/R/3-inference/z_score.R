pop_size = 1000
X <- rnorm(pop_size, mean = 10, sd = 2)
Z <- (X - mean(X)) / sd(X)
plot(density(Z))
xgrid <- seq(-4, 4, by = 0.1, lty=1)
lines(xgrid, dnorm(xgrid), lty=2)