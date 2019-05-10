# t-distribution

library("colorspace")
windows(width = 8, height = 3)
par(mar = c(4, 4, 1, 1))

X <- seq(-5, 5, by = 0.1)
df <- c(1, 2, 5, 10, 20, 30)
pal <- rainbow_hcl(length(df))

pdf <- array(dim = c(length(X), length(df)))
cdf <- array(dim = c(length(X), length(df)))

for (i in 1:length(df)) {
  pdf[,i] <- dt(X, df = df[i])
}

plot(x = X, y = pdf[,1],
     type = 'l', ylim = c(0, max(pdf) + 0.05), col = pal[1], lwd = 2,
     xlab = "X", ylab = "PDF")

for (i in 2:length(df)) {
  lines(x = X, y = pdf[,i], lty = i, col = pal[i], lwd = 2)
}
lines(x = X, y = dnorm(X), lwd = 2)

legend("topright",
       legend = c(paste("df=", df, sep = ""), "Normal"),
       lty = c(1:length(df), 1),
       col = c(pal, 1),
       lwd = 2)

dev.copy2pdf(file = "plots/t_distribution.pdf")