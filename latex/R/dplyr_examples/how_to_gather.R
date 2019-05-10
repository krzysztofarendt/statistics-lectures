library(tidyverse)

x <- 1:10
y <- x ^ 2
z <- rnorm(n = length(x))
c <- c('a', 'a', 'a', 'b', 'b', 'c', 'c', 'd', 'd', 'd')

df <- tibble(x = x, y = y, z = z, c = c)

df2 <- gather(df, key = 'variable', value = 'value', -x)
print(df2)


ggplot(df2, aes(x, value)) +
 geom_point() +
 facet_wrap(~ variable)