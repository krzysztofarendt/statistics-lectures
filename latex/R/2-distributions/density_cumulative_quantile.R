
p = 0.5     # Probability of success in a single trial
s = 20      # Number of trials
x <- 1:20   # Sequence of trials (we want to know the probability for each x)
px <- seq(0, 1, by=0.001)

pmf <- dbinom(x, size=s, prob=p)
cdf <- pbinom(x, size=s, prob=p)
qf <- qbinom(px, size=s, prob=p)

windows(width=8, height=3)
par(mfrow=c(1, 3), mar=c(4.1, 4, 3, 1))

plot(x, pmf, type='p', pch=0, main="PMF (p=0.5, n=20)", ylab="f(x)")
plot(x, cdf, type='p', pch=0, main="CDF (p=0.5, n=20)", ylab="F(x)")
plot(px, qf, type='l', main="Quantile function (p=0.5, n=20)", ylab="Q(p)", xlab="p")

dev.copy2pdf(file="plots/density-cumulative-quantile.pdf")