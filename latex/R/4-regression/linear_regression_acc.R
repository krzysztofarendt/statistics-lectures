# Linear regression

library('tidyverse')

x <- seq(0, 100, by = 1)

df <- tibble(
  X = x,
  Y1 = 15 + 0.7 * x + rnorm(length(x), mean = 0, sd = 10),
  Y2 = 15 + 0.7 * x + rnorm(length(x), mean = 0, sd = 10),
  Y3 = 15 + 0.7 * x + rnorm(length(x), mean = 0, sd = 10),
  Y4 = 15 + 0.7 * x + rnorm(length(x), mean = 0, sd = 10),
  Y5 = 15 + 0.7 * x + rnorm(length(x), mean = 0, sd = 10)
)

p <- ggplot(data = df, mapping = aes(x = X, y = Y1)) +
  theme_light() +
  theme(
    panel.background = element_rect(fill = "transparent"), # bg of the panel
    plot.background = element_rect(fill = "transparent", colour = NA), # bg of the plot
    legend.background = element_rect(fill = "transparent"), # get rid of legend bg
    legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
  )

for (n in names(df)) {
  if ((n != 'X')) {
    print(n)
    p <- p + geom_smooth(mapping = aes_string(x = "X", y = n), method = 'lm', se = F, size = 0.25)
  }
}

print(p)

ggsave("plots/linear_regression_acc.pdf", width = 8, height = 4)