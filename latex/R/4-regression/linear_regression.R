# Linear regression

library('tidyverse')

df <- tibble(
  X = 1:100,
  Y = 15 + 0.7 * 1:100 + rnorm(100, mean = 0, sd = 10)
)

p <- ggplot(data = df, mapping = aes(x = X, y = Y)) +
  geom_point(shape = 0) +
  theme_light() +
  theme(
    panel.background = element_rect(fill = "transparent"), # bg of the panel
    plot.background = element_rect(fill = "transparent", colour = NA), # bg of the plot
    legend.background = element_rect(fill = "transparent"), # get rid of legend bg
    legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
  )

p1 <- p + geom_smooth(method = 'lm', se = F)
p2 <- p + geom_smooth(method = 'lm', se = T)
print(p1)
print(p2)

ggsave("plots/linear_regression.pdf",
       plot = p1,
       width = 8,
       height = 4)

ggsave("plots/linear_regression_SE.pdf",
       plot = p2,
       width = 8,
       height = 3)