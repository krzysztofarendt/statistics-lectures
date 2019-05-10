# Train
n <- 100
f <- function(x) {5 + 2.3 * X1^3} 
f_noisy <- function(x) {f(x) + rnorm(n, sd = 2)}
X1 <- rnorm(n)
Y <- f_noisy(X1)

m1 <- lm(Y ~ I(X1^3))
m2 <- lm(Y ~ X1)

# Compare
df <- data.frame(Y1 = predict(m1), Y2 = predict(m2), X1 = X1)
df <- df[order(X1),]

windows(width=5, height=6)
par(mar=c(4,4,1,1))
plot(X1, Y)
lines(df$X1, df$Y1, col='red')
lines(df$X1, df$Y2, col='blue')
legend('topleft', legend=c('Data', 'Polynomial regression', 'Linear regression'),
       col=c('black', 'red', 'blue'),
       pch=c(1, NA, NA), lty=c(NA, 1, 1))
dev.copy2pdf(file="plots/poly_regression.pdf")