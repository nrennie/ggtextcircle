library(ggplot2)
library(dplyr)
library(charlatan)

# fake data
set.seed(123)
plot_df <- data.frame(name = charlatan::ch_name(n = 30))

# params
r <- 3
x0 <- 1
y0 <- 1
start <- 0
end <- 0

# data transformation
plot_data <- plot_df %>%
  mutate(
    theta = seq(pi / 4, (7 / 4) * pi, length.out = nrow(.)),
    x = x0 + r * cos(theta),
    y = y0 + r * sin(theta),
    angle = 180 + 360 * (theta / (2 * pi))
  )

# plot with ggplot2
ggplot() +
  geom_text(
    data = plot_data,
    mapping = aes(
      x = x, y = y, angle = angle, label = name
    ),
    hjust = 1
  )

# basic example
ggplot(data = plot_df) +
  geom_textcircle(mapping = aes(label = name))

# styled example
ggplot(data = plot_df) +
  geom_textcircle(mapping = aes(label = name), hjust = 1, size = 3) +
  scale_x_continuous(limits = c(-6, 5)) +
  scale_y_continuous(limits = c(-6, 6)) +
  coord_fixed() +
  theme_void()

#TODO: documentation for parameters
#TODO: implement start and end
#TODO: set default hjust = 1

