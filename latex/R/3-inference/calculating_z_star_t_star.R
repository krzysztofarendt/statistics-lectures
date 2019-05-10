# z*
z90 <- qnorm(0.5 + 0.90/2)
z95 <- qnorm(0.5 + 0.95/2)
z99 <- qnorm(0.5 + 0.99/2)
z995 <- qnorm(0.5 + 0.995/2)

df <- data.frame(c = c(90, 95, 99, 99.5),
                 z = c(z90, z95, z99, z995))

print(df)

# t*