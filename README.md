# ggtextcircle

R package to plot text in a (partial or full) circle.

## Example

Generate some data using the {charlatan} package (only required for examples, not required for package):

```r
set.seed(123)
plot_df <- data.frame(name = charlatan::ch_name(n = 30))
```

Basic usage:

```r
ggplot(data = plot_df) +
  geom_textcircle(mapping = aes(label = name))
```

![](man/figures/example1.png)

With styling:

```r
ggplot(data = plot_df) +
  geom_textcircle(mapping = aes(label = name), hjust = 1, size = 3) +
  scale_x_continuous(limits = c(-6, 5)) +
  scale_y_continuous(limits = c(-6, 6)) +
  coord_fixed() +
  theme_void()
```

![](man/figures/example2.png)
