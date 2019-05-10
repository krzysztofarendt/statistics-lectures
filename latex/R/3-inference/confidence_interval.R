# Population
x <- rnorm(1000000, mean = 5, sd = 3)

# Distribution of the means: 100 samples of size 50
n <- 50
n_samples <- 30
SEM <- numeric(length = length(n_samples))
means <- numeric(length = length(n_samples))

for (i in 1:n_samples) {
  s <- sample(x, size = n)
  means[i] <- mean(s)
  SEM[i] <- sd(s) / sqrt(n)
}

ub <- means + 1.6 * SEM
lb <- means - 1.6 * SEM

# Plotting parameters
windows(width = 8, height = 4)
par(mar = c(5, 5, 1, 1))

# Plot means
plot(means, pch = 0, ylim = c(min(lb), max(ub)), ylab = expression(bar(X)), xlab = "Sample number")

# Plot CI
for (i in 1:length(means)) {
  lines(c(i, i), c(lb[i], ub[i]))
}

# Plot the true mean
lines(1:length(means), rep(mean(x), times = length(means)), lty = 2)

dev.copy2pdf(file = "plots/CI.pdf")



