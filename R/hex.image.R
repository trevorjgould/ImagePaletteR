#' hex.image
#'
#' This creates a color palette from an image
#'
#' @param x image file
#' @param y number of colors to provide
#'
#' @example
#' out <- hex.image("Eternal_sunshine.png",6)
#' @export

hex.image <- function(x,y){
  img <- imager::load.image(x)
  out <- getHexPrimaries(img, y)
  if(y>10){y=10}
  colnum <- y
  p <- show_color(out, ncol=colnum, border = "white", label = TRUE)
  p
  ggplot2::ggsave(p, file = "temp.png", height = ((dim(img)[2])*.25), width = dim(img)[1], units = "px", dpi = 800)
  a <- magick::image_read(x)
  b <- magick::image_read("temp.png")
  filename <- paste0("your_palette.png")
  both <- c(a,b)
  both <- magick::image_append(both,stack=TRUE)
  plot(both)
  magick::image_write(both, path = filename, format = "png")
  file.remove("temp.png")
  return(out)
}