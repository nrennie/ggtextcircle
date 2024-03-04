#' Stat function for textcircle
#'
#' @param geom geom
#' @param mapping mapping
#' @param data data
#' @param position position
#' @param na.rm na.rm
#' @param hjust alignment of text
#' @param show.legend show.legend
#' @param inherit.aes inherit.aes
#' @param ... inherited
#'
#' @export

stat_textcircle <- function(geom = ggplot2::GeomText,
                            mapping = NULL,
                            data = NULL,
                            position = "identity",
                            na.rm = FALSE,
                            hjust = 1,
                            show.legend = NA,
                            inherit.aes = TRUE, ...) {
  ggplot2::layer(
    stat = StatTextcircle,
    geom = geom,
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, hjust = hjust, ...)
  )
}

#' Geom function for textcircle
#'
#' @param geom geom
#' @param mapping mapping
#' @param data data
#' @param position position
#' @param na.rm na.rm
#' @param hjust alignment of text
#' @param show.legend show.legend
#' @param inherit.aes inherit.aes
#' @param ... inherited
#'
#' @export

geom_textcircle <- stat_textcircle

