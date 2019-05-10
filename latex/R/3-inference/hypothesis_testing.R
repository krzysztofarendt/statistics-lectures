library(latex2exp)

windows(width = 8, height = 3)
par(mfrow = c(1, 2), mar = c(4, 4, 1.5, 1))

x <- seq(-4, 4, by = 0.01)
y <- dnorm(x, mean = 0, sd = 1)

# Double-sided test
plot(x, y, type = 'l', xlab = 'Z, T', ylab = 'PDF', main = "Double-sided test")

xpl <- x[x <= -2]
ypl <- y[x <= -2]
xpr <- x[x >= 2]
ypr <- y[x >= 2]

polygon(c(-2, xpl[1], xpl),
        c(0, 0, ypl),
        col = 'orange')

polygon(c(xpr[length(xpr)], 2, xpr),
        c(0, 0, ypr),
        col = 'orange')

text(-2.5, 0.35, c("p-value=A+B"))
text(-3, 0.07, c("A"))
text(3, 0.07, c("B"))
abline(v = 0, lty = 2)
abline(v = 2, lty = 2)
arrows(x0 = -3, y0 = 0.05, y1 = 0.01, length = 0.1)
arrows(x0 = 3, y0 = 0.05, y1 = 0.01, length = 0.1)

text(3.4, 0.2, TeX('$\\frac{\\bar{x} - \\mu}{SE_{\\bar{x}}$'))
arrows(x0 = 2.7, y0 = 0.198, x1 = 2, length = 0.1)

text(-0.3, 0.15, 'Null hypothesis', srt = 90)

# Single-sided test
plot(x, y, type = 'l', xlab = 'Z, T', ylab = 'PDF', main = "Single-sided test")

xpr <- x[x >= 2]
ypr <- y[x >= 2]

polygon(c(xpr[length(xpr)], 2, xpr),
        
        c(0, 0, ypr),
        col = 'orange')

text(3, 0.07, "p-value")
abline(v = 0, lty = 2)
abline(v = 2, lty = 2)
arrows(x0 = 3, y0 = 0.05, y1 = 0.01, length = 0.1)

text(3.4, 0.2, TeX('$\\frac{\\bar{x} - \\mu}{SE_{\\bar{x}}$'))
arrows(x0 = 2.7, y0 = 0.198, x1 = 2, length = 0.1)

text(-0.3, 0.15, 'Null hypothesis', srt = 90)

# Save PDF
dev.copy2pdf(file = "plots/hypothesis_testing.pdf")