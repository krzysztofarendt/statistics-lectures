# Data creation -------------------------------------------
rm(list=ls())
library("tidyverse")
library("gridExtra")

noise = 5

x <- rnorm(n = 30, mean = 50, sd = 5)
g1 <- x * 1.45 + rnorm(n = length(x), sd = noise)
g2 <- x * 1.50 + rnorm(n = length(x), sd = noise)
g3 <- x * 1.55 + rnorm(n = length(x), sd = noise)

gf <- tibble(g1 = g1, g2 = g2, g3 = g3)
xdf <- cbind(x, gf)
df <- gf %>% gather(key = "Group", value = "Value")

# Scatter plot --------------------------------------------
windows(width = 8, height = 4)
par(mar = c(4, 4, 1, 1))

ymin <- min(g1, g2, g3) - 5
ymax <- max(g1, g2, g3) + 5

plot(g1, pch = 1, col = 1,
     ylim = c(ymin, ymax),
     xlim = c(1, length(x) + 2),
     xlab = "Observation",
     ylab = "Value")
points(g2, pch = 2, col = 2)
points(g3, pch = 3, col = 3)
legend("topright", legend = c('g1', 'g2', 'g3'),
       pch = 1:3, col = 1:3)

dev.copy2pdf(file = "plots/anova_3_groups_scatter.pdf")

# Density plot --------------------------------------------
windows(width = 8, height = 4)
p1 <- ggplot(df, aes(Value, fill = Group)) +
  geom_density(alpha = 0.3) +
  ylab("PDF") + xlab(" ") +
  theme_minimal() +
  theme(legend.position = c(0.8, 0.8),
        legend.direction = "horizontal") +
  ggtitle("Grouped observations") +
  ylim(0, 0.1)

p2 <- ggplot(df, aes(Value)) + geom_density() +
  ylab("PDF") +
  theme_minimal() +
  ggtitle("All observations")

p <- grid.arrange(p1, p2, nrow = 2)

ggsave("plots/anova_3_groups_density.pdf", plot = p)

# Boxplot -------------------------------------------------
windows(width = 4, height = 4)
par(mar = c(4, 4, 1, 1))
boxplot(g1, g2, g3, names = c('g1', 'g2', 'g3'),
        col=rainbow(3))
dev.copy2pdf(file = "plots/anova_3_groups_boxplot.pdf")

# ANOVA ---------------------------------------------------
aov_res <- aov(Value ~ Group, data = df)
summary(aov_res)


