#' Compute textcircle
#'
#' @param data
#' @param scales
#' @param r
#' @param x0
#' @param y0
#'
#' @return
#' @export
#'
#' @examples
compute_panel_textcircle <- function(data, scales, r = 3, x0 = 0, y0 = 0) {
  dplyr::mutate(
    data,
    theta = seq(pi / 4, (7 / 4) * pi, length.out = nrow(data)),
    x = x0 + r * cos(theta),
    y = y0 + r * sin(theta),
    angle = 180 + 360 * (theta / (2 * pi))
  )
}




StatTextcircle <- ggplot2::ggproto(
  `_class` = "StatTextcircle",
  `_inherit` = ggplot2::Stat,
  required_aes = c("label"),
  compute_panel = compute_panel_textcircle,
  default_aes = ggplot2::aes(
    x = ggplot2::after_stat(x),
    y = ggplot2::after_stat(y)
  )
)
 # requires label as aes