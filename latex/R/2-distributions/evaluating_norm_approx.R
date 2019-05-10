# Data set
X1 <- rbeta(50, shape1 = 3, shape2 = 5) * 60 + 150
X2 <- rnorm(50, mean = 180, sd = 10)

windows(width = 8, height = 5)
par(mfrow = c(2, 2))

h <- hist(X1)
mlp <- mean(h$counts / h$density)
xn <- seq(150, 210, by = 0.1)
yn <- dnorm(xn, mean = mean(X1), sd = sd(X1))
lines(xn, yn * mlp, type = 'l')

hist(X2)
mlp <- mean(h$counts / h$density)
xn <- seq(150, 210, by = 0.1)
yn <- dnorm(xn, mean = mean(X2), sd = sd(X2))
lines(xn, yn * mlp, type = 'l')

qqnorm(X1)
qqline(X1)

qqnorm(X2)
qqline(X2)

dev.copy2pdf(file = "plots/eval_norm_approx.pdf")