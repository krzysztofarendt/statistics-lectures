# This script does not really perform any regression.
# It just plots a clean 3D function and a noisy 3D function,
# to explain the concept of linear regression.

x <- seq(0, 100, 10) + runif(11, min=0, max=0.9)
y <- seq(0, 100, 10) + runif(11, min=0, max=0.9)

f_clean <- function(x, y){
  2 * x + 0.75 * y
}

f_noisy <- function(x, y){
  f_clean(x, y) + rnorm(n=length(x), mean=0, sd=10)
}

z_noisy <- outer(x, y, f_noisy)
z_clean <- outer(x, y, f_clean)

windows()
par(mar=c(1, 1, 1, 1))
persp(x=x, y=y, z=z_noisy, phi=45, theta=45)
dev.copy2pdf(file="plots/regression-2d-noisy.pdf")

windows()
par(mar=c(1, 1, 1, 1))
persp(x=x, y=y, z=z_clean, phi=45, theta=45, zlab='Prediction')
dev.copy2pdf(file="plots/regression-2d-clean.pdf")