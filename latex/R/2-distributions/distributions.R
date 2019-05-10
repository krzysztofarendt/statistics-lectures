windows(width = 4, height = 5.8)
par(mfrow = c(3, 1))

# Binomial distribution
x <- 1:20
p <- dbinom(x, size = length(x), prob = 0.5)
plot(x, p, type="p", pch = 0,
     main="1) Binomial distribution",
     xlab="X",
     ylab="P(X)")

# Geometric distribution
p <- dgeom(x, prob = 0.5)
plot(x, p, type="p", pch = 0,
     main="2) Geometric distribution",
     xlab="X",
     ylab="P(X)")

# Normal distribution
x <- seq(0, 20, by = 0.1)
p <- dnorm(x, mean = 10, sd = 2)
plot(x, p, type = "l",
     main = "3) Normal distribution",
     xlab = "X",
     ylab = "P(X)")

dev.copy2pdf(file = "plots/distributions.pdf")
