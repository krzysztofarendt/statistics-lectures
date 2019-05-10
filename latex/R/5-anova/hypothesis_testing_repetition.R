library(latex2exp)

x <- seq(-5, 5, by = 0.1)
y <- dnorm(x)

mu0 <- mean(x)
mu1 <- mu0 + 1

windows(width = 10, height = 5)

plot(x, y, type = 'l', col = 'black',
     main = TeX("Summary of the hypothesis testing procedure ($H_0$: $\\mu_0 = \\mu_1$)"),
     ylab = "PDF", xlab = "Z")

segments(
  x0 = mu0, y0 = dnorm(mu0),
  x1 = mu0, y1 = 0,
  col = 'blue'
)

segments(
  x0 = mu1, y0 = dnorm(mu1),
  x1 = mu1, y1 = 0,
  col = 'red'
)

s <- 1
text(0.2, 0.3, TeX("$\\mu_0$"), col = 'blue', cex = s)
text(1.2, 0.1, TeX("$\\mu_1$"), col = 'red', cex = s)
text(2, 0.36, TeX("$SE = \\frac{\\sigma}{\\sqrt{n}}$"), adj = c(0, NA), cex = s)
text(2, 0.30, TeX("$Z = \\frac{\\mu_1 - \\mu_0}{SE}$"), adj = c(0, NA), cex = s)
text(2, 0.24, TeX("$p-value = P(X \\geq Z)$"), adj = c(0, NA), cex = s)
text(2, 0.18, TeX("Reject $H_0$ if p-value < $\\alpha$"), adj = c(0, NA), cex = s)
text(-2.5, 0.3, "Normal or t-distribution", cex = s)
arrows(x0 = -2.3, y0 = 0.27, x1 = -1.6, y1 = 0.14, length = 0.1)

dev.copy2pdf(file = "plots/hypothesis_test_summary.pdf")