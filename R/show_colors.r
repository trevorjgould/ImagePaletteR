#' show_colors
#'
#' This function returns colors.
#'
#' @keywords internal
#' colors list of colors
#' ncol number of colors
#' byrow boolean
#' label boolean
#' number boolean
#' size 1
#' border black
#' @export


# author of show_color function: Chai
show_color <- function(colors, ncol, byrow = TRUE,
                       label = FALSE, number = FALSE, size = 1,
                       border = "black") {
  xmid <- ymid <- NULL
  len <- length(colors)
  nrow <- ifelse(len %% ncol == 0, len / ncol, len %/% ncol + 1)
  n <- nrow * ncol
  s <- c(colors, rep("white", abs(n - len)))
  x <- numeric(n)
  y <- numeric(n)
  if (byrow == TRUE) {
    x <- rep(seq(1, by = 1, length.out = ncol), nrow)
    y <- rep(seq(-1, by = -1, length.out = nrow), each = ncol)
  } else {
    x <- rep(seq(1, by = 1, length.out = ncol), each = nrow)
    y <- rep(seq(-1, by = -1, length.out = nrow), ncol)
  }
  x2 <- x
  y2 <- y + 1
  d <- data.frame(
    x = x - 1, y = y,
    x2, y2,
    col = s
  )
  ggplot2::ggplot() +
    ggplot2::geom_rect(
      data = d, ggplot2::aes(
        xmin = x, xmax = x2,
        ymin = y, ymax = y2,
        fill = I(s)
      ),
      colour = border
    ) +
    ggplot2::theme_void() -> p
  
  if (label == TRUE) {
    col_v <- grDevices::rgb2hsv(grDevices::col2rgb(colors))[3, ]
    v <- ifelse(col_v > 0.6, "black", "white")
    v <- append(v, rep("white", abs(n - len)))
    l <- s
    col2 <- v
    d$xmid = (d$x + d$x2) / 2
    d$ymid = (d$y + d$y2) / 2
    
    if (number == TRUE) {
      d1$l <- append(1:len, rep(0, abs(n - len)))
    }
    p <- p +
      ggplot2::geom_text(data = d, ggplot2::aes(xmid, ymid, label = l, color = I(col2)), size = 0.5)
    #   p <- p +
    #      geom_text(aes(x, y, label = l, color = I(col2)),
    #       data = d1
  }
  return(p)
}
