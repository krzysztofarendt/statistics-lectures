x <- seq(0, 1, 0.01)
p1 <- rep(1, times = length(x))
p2 <- 2 * x
p3 <- dnorm(x, mean = 0.5, sd = 0.3)

windows(width=8, height=3)
par(mfrow=c(1, 3))

plot(x, p1, type = "l", ylab = "PDF", xlab = "X", ylim = c(0, 1.1), main="(a)")
segments(x0 = c(0, 1),
         y0 = c(0, 0),
         x1 = c(0, 1),
         y1 = c(1, 1))

plot(x, p2, type = "l", ylab = "PDF", xlab = "X", main="(b)")
segments(x0 = 1, y0 = 0, x1 = 1, y1 = 2)


plot(x, p3, type = "l", ylab = "PDF", xlab = "X", main="(c)")

dev.copy2pdf(file="plots/expected_value_pdf_ex.pdf")