library(tidyverse)

x <- 1:10
y <- x ^ 2
z <- rnorm(n = length(x))

df <- tibble(x = x, y = y, z = z)
df2 <- filter(df, x < 5, x > 2)

print(df2)
