library(tidyverse)

x <- seq(0.1, 6, by = 0.1)
df1 <- df(x, df1 = 3, df2 = 3)
df2 <- df(x, df1 = 4, df2 = 10)
df3 <- df(x, df1 = 15, df2 = 2)
df4 <- df(x, df1 = 2, df2 = 87)

lab <- function(variable, value) {
  mapping <- list(
    "df1" = "df1=3, df2=3",
    "df2" = "df1=4, df2=10",
    "df3" = "df1=15, df2=2",
    "df4" = "df1=2, df2=87"
  )
  return(mapping[value])
}

df <- tibble(x = x, df1 = df1, df2 = df2, df3 = df3, df4 = df4)

gf <- gather(df, key = "df", value = "value", -x)

windows(width = 8, height = 4)
ggplot(gf, aes(x, value)) +
  geom_line() +
  facet_wrap(~ df, labeller = lab) +
  ylab("Relative frequency") +
  xlab("F") +
  theme_bw() +
  theme(
    panel.background = element_rect(fill = "transparent"), # bg of the panel
    plot.background = element_rect(fill = "transparent", colour = NA), # bg of the plot
    legend.background = element_rect(fill = "transparent"), # get rid of legend bg
    legend.box.background = element_rect(fill = "transparent") # get rid of legend panel bg
  )

ggsave("plots/f_distribution.pdf")