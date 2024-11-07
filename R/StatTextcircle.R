#' Compute textcircle
#'
#' @param data data
#' @param scales scales
#' @param r radius of inner circle
#' @param x0 x coordinate of inner circle
#' @param y0 y coordinate of inner circle
#' @param start start degree (should be between 0 and 180)
#' @param end end degree (should be between 0 and -180)
#' @importFrom rlang .data

compute_panel_textcircle <- function(
    data,
    scales,
    r = 3,
    x0 = 0,
    y0 = 0,
    start = 45,
    end = -45) {
  dplyr::mutate(
    data,
    theta = seq(((pi * start) / 180), pi * (2 + ((end) / 180)),
      length.out = nrow(data)
    ),
    x = x0 + r * cos(.data$theta),
    y = y0 + r * sin(.data$theta),
    angle = 180 + 360 * (.data$theta / (2 * pi))
  )
}

StatTextcircle <- ggplot2::ggproto(
  `_class` = "StatTextcircle",
  `_inherit` = ggplot2::Stat,
  required_aes = c("label"),
  compute_panel = compute_panel_textcircle
)
