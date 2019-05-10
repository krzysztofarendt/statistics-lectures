# Define X and Y
X <- rnorm(500, mean = 20, sd = 3)
Y <- -1.3 * X + 70 + rnorm(length(X), mean = 0, sd = 10)
# Put X, Y in a data frame
df <- tibble(X = X, Y = Y)
# Plot the regression line togethe with SE using ggplot2
ggplot(df, mapping = aes(x = X, y = Y)) +
  geom_smooth(method = 'lm', se = T) +
  geom_point(pch = 0) +
  theme_light() +
  theme(
    panel.background = element_rect(fill = "transparent"), # bg of the panel
    plot.background = element_rect(fill = "transparent", colour = NA), # bg of the plot
    legend.background = element_rect(fill = "transparent"), # get rid of legend bg
    legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
  )
# Fit a linear model using lm()
linmod <- lm(Y ~ X)
summary(linmod)

ggsave('plots/linear_regression_example.pdf', width=5, height=8)