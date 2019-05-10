# Correct approximation
n <- 50
p <- 0.5

xbinom <- dbinom(0:n, size = n, prob = p)
xnorm <- dnorm(0:n, mean = n*p, sd = sqrt(n*p*(1-p)))

windows(width = 8, height = 4)

plot(xbinom, pch = 0, ylab = "PMF, PDF", xlab = "n", col = 1, main=paste0("n=", n, "; p=", p))
lines(xnorm, col = 2)

legend("topright", legend = c("Binomial distribution", "Normal distribution"), lty = c(NA, 1),
       col = c(1, 2), pch = c(0, NA))


dev.copy2pdf(file = "plots/norm_approx_to_binom.pdf")

# Incorrect approximation
n <- 7
p <- 0.2

xbinom <- dbinom(0:n, size = n, prob = p)
xnorm <- dnorm(0:n, mean = n*p, sd = sqrt(n*p*(1-p)))

windows(width = 8, height = 4)

plot(xbinom, pch = 0, ylab = "PMF, PDF", xlab = "n", col = 1, main=paste0("n=", n, "; p=", p))
lines(xnorm, col = 2)

legend("topright", legend = c("Binomial distribution", "Normal distribution"), lty = c(NA, 1),
       col = c(1, 2), pch = c(0, NA))

dev.copy2pdf(file = "plots/norm_approx_to_binom_2.pdf")