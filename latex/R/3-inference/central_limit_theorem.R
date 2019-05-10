# Script showing that the CTL holds true also for non-normal distributions

pop_size = 10000

# Uniform distribution
ud <- runif(pop_size, min = 0, max = 10)

# Exponential distribution
ed <- rexp(pop_size, rate = 1)

windows(width = 8, height = 6)
par(mfrow = c(3, 2), oma = c(0, 1, 0, 0))

hist(ud, main = "Uniform distribution", xlab = "X")
hist(ed, main = "Exponential distribution", xlab = "X")

sampling_dist <- function(x, sample_size, samples) {
  m <- numeric(length = samples)
  for (i in 1:samples) {
    m[i] <- mean(sample(x, size = sample_size))
  }
  # Return
  m
}

# Uniform: 5 samples of size 50
sdm <- sampling_dist(ud, sample_size = 50, samples = 5)
x <- seq(3, 7, by = 0.1)
fx <- dnorm(x, mean = mean(ud), sd = sd(ud) / sqrt(50))

plot(x, fx, main = "5 samples of size 50", type = 'l', lty = 1,
     ylim = c(0, max(density(sdm)$y, fx)),
     xlab = expression(bar(x)), ylab = "PDF")
lines(density(sdm),
      type = 'l', lty = 2)
legend("topright", legend = c("Normal", "Actual"), lty = 1:2)

# Exponential: 5 samples of size 50
sdm <- sampling_dist(ed, sample_size = 50, samples = 5)
x <- seq(0, 2, by = 0.05)
fx <- dnorm(x, mean = mean(ed), sd = sd(ed) / sqrt(50))

plot(x, fx, main = "5 samples of size 50", type = 'l', lty = 1,
     ylim = c(0, max(density(sdm)$y, fx)),
     xlab = expression(bar(x)), ylab = "PDF")
lines(density(sdm),
      type = 'l', lty = 2)
legend("topright", legend = c("Normal", "Actual"), lty = 1:2)

# Uniform: 500 samples of size 50
sdm <- sampling_dist(ud, sample_size = 50, samples = 500)
x <- seq(3, 7, by = 0.1)
fx <- dnorm(x, mean = mean(ud), sd = sd(ud) / sqrt(50))

plot(x, fx, main = "500 samples of size 50", type = 'l', lty = 1,
     ylim = c(0, max(density(sdm)$y, fx)),
     xlab = expression(bar(x)), ylab = "PDF")
lines(density(sdm),
      type = 'l', lty = 2)
legend("topright", legend = c("Normal", "Actual"), lty = 1:2)

# Exponential: 500 samples of size 50
sdm <- sampling_dist(ed, sample_size = 50, samples = 500)
x <- seq(0, 2, by = 0.05)
fx <- dnorm(x, mean = mean(ed), sd = sd(ed) / sqrt(50))

plot(x, fx, main = "500 samples of size 50", type = 'l', lty = 1,
     ylim = c(0, max(density(sdm)$y, fx)),
     xlab = expression(bar(x)), ylab = "PDF")
lines(density(sdm),
      type = 'l', lty = 2)
legend("topright", legend = c("Normal", "Actual"), lty = 1:2)

# Save PDF
dev.copy2pdf(file = "plots/central-limit-theorem.pdf")