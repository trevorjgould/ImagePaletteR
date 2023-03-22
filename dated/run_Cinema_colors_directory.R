# adapted from:
# https://stackoverflow.com/questions/54412166/extracting-top-2-3-hex-colors-from-images-in-r
#source images from: https://www.facebook.com/cinemapalettes
# Trevor Gould
# had to install quartsx11
library(scales)
library(imager)
library(data.table)
library(ggplot2)
library(magick)
# this function takes an image in imager's cimg format and 
# returns the hex colour codes for the top [cutoff] colors by
# kmeans clustering coverage area of the image. 

# author of show_color function: Chai
show_color <- function(colors, ncol, byrow = TRUE,
                       label = FALSE, number = FALSE, size = 1,
                       border = "black") {
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
  ggplot() +
    geom_rect(
      data = d, aes(
        xmin = x, xmax = x2,
        ymin = y, ymax = y2,
        fill = I(s)
      ),
      colour = border
    ) +
    theme_void() -> p
  
  if (label == TRUE) {
    col_v <- rgb2hsv(col2rgb(colors))[3, ]
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
      geom_text(data = d, aes(xmid, ymid, label = l, color = I(col2)), size = 0.5)
    #   p <- p +
    #      geom_text(aes(x, y, label = l, color = I(col2)),
    #       data = d1
  }
  return(p)
}


dir_image <- function(dir,cutoff){

# runs on current directory of images
image_list <- list.files(dir)

# kmeans clustering of image
getHexPrimaries <- function(img, cutoff){
  
  #convert cimg to workable format
  channel.labels <- c('R','G','B','A')[1:dim(img)[4]]
  img <- as.data.table(as.data.frame(img))
  img[,channel := factor(cc ,labels=channel.labels)]
  img <- dcast(img, x+y ~ channel, value.var = "value")
  
  #sort by unique rgb combinations and identify the primary colours
  colours.sorted <- img[, .N, by=list(R,G,B)][order(-N)]
  # because I'm me. 
  k_means<- kmeans(colours.sorted[,1:3], centers = cutoff, iter.max = 30)
  
  #convert to hex
  hex.primaries <- 
    apply(k_means$centers, 1, function(row){
      hex <- rgb(row[1], row[2], row[3], maxColorValue=1)
      hex
    })
  
  hex.primaries
}

# run getHexPrimaries on image_list
hex.list <- lapply(image_list, function(x) {
  img <- load.image(x)
  cutoff = 10
  out <- getHexPrimaries(img, cutoff)
  p <- show_color(out, ncol=cutoff, border = "white", label = TRUE)
  p
  ggsave(p, file = "temp.jpg", height = ((dim(img)[2])*.25), width = dim(img)[1], units = "px", dpi = 800)
  a <- image_read(x)
  b <- image_read("temp.jpg")
  filename <- paste0("full_",x)
  both <- c(a,b)
  both <- image_append(both,stack=TRUE)
  image_write(both, path = filename, format = "png")
  return(out)
})

# convert to a table
names(hex.list) <- image_list
hex.out <- t(as.data.frame(hex.list))
file.remove("temp.jpg")
return(hex.out)
}

dir_image(".",10)
