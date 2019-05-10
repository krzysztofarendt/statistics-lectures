# Probability density function
x <- seq(-3, 3, by = 0.1)
p <- dnorm(x)
windows(width=8, height=3)
plot(x, p, type="l",
     main="Probability distribution function (PDF)",
     xlab="X",
     ylab="PDF")

dev.copy2pdf(file="plots/pdf.pdf")

# Probability mass function
x <- seq(-3, 3, by = 1)
p <- c(0.03, 0.07, 0.2, 0.4, 0.2, 0.07, 0.03)
windows(width=8, height=3)
plot(x, p, type="h",
     main="Probability mass function (PMF)",
     xlab="X",
     ylab="PMF")
dev.copy2pdf(file="plots/pmf.pdf")
