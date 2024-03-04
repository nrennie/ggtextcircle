library(ggplot2)
library(dplyr)
library(charlatan)

# fake data
set.seed(123)
plot_df <- data.frame(name = charlatan::ch_name(n = 10))

# params
r <- 3
x0 <- 1
y0 <- 1
start <- 0
end <- 0

plot_data <- plot_df %>%
  mutate(
    theta = seq(pi / 4, (7 / 4) * pi, length.out = nrow(.)),
    x = x0 + r * cos(theta),
    y = y0 + r * sin(theta),
    angle = 180 + 360 * (theta / (2 * pi))
  )

ggplot() +
  geom_text(
    data = plot_data,
    mapping = aes(
      x = x, y = y, angle = angle, label = name
    ),
    hjust = 1
  )

# need to expand beyond radius
# x and y are taken, use x0 and y0
# implement start and end