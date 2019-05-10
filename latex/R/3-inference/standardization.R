library(RColorBrewer)
pal <- brewer.pal(4, 'Set1')

# Generate population
X <- rnorm(100000, mean = 10, sd = 2)

# Take 100 samples and calculate the means


calc_Z <- function(x, n_samples, s_size) {

  samples <- matrix(nrow = s_size, ncol = n_samples)
  
  for (i in 1:n_samples) {
     samples[,i] <- sample(x, size = s_size)
  }
  
  samples <- data.frame(samples)
  
  means <- numeric(length = length(names(samples)))
  
  i <- 1
  for (n in names(samples)) {
    means[i] <- mean(samples[[n]])
    i <- i + 1
  }
  
  SE <- sd(x) / sqrt(s_size)
  Z <- (means - mean(x)) / SE
  
  Z
}

Z1 <- calc_Z(X, n_samples = 5000, s_size = 50)
Z2 <- calc_Z(X, n_samples = 100, s_size = 50)
Z3 <- calc_Z(X, n_samples = 10, s_size = 50)

x <- seq(-5, 5, by = 0.1)
y <- dnorm(x)

windows(width = 10, height = 4)
par(mar = c(5, 4, 1, 1))

plot(x, y, lty = 1, col = pal[1], xlim = c(-4, 4), ylim = c(0, 0.5), type = "l", lwd = 2,
     xlab = "",
     ylab = "PDF")
lines(density(Z1), lty = 2, col = pal[2], lwd = 2)
lines(density(Z2), lty = 3, col = pal[3], lwd = 2)
lines(density(Z3), lty = 4, col = pal[4], lwd = 2)

mtext(expression(paste("Z = ", over(bar(X) - mu, sigma / sqrt(n)))), side = 1, line = 4)

legend("topright",
       legend = c("Normal", "n_samples=5000, s_size=50", "n_samples=100, s_size=50", "n_samples=10, s_size=50"),
       lty = 1:4, col = pal[1:4], lwd = 2)

dev.copy2pdf(file = "plots/standardization.pdf")