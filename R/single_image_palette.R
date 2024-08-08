#' single_image_palette
#'
#' This creates a color palette from an image
#'
#' @param img image file
#' @param cutoff number of colors to provide
#'
#' @export


# functions
# had to install quartsx11
#library(scales)
#library(imager)
#library(data.table)
#library(ggplot2)
#library(magick)
# this function takes an image in imager's cimg format and 
# returns the hex colour codes for the top [cutoff] colors by
# kmeans clustering coverage area of the image. 

# usage:  
# out <- hex.image("Eternal_Sunshine2.jpeg",20)

# kmeans clustering of image
getHexPrimaries <- function(img, cutoff){
  channel <- cc <- .N <- R <- N <- G <- B <- NULL
  #convert cimg to workable format
  channel.labels <- c('R','G','B','A')[1:dim(img)[4]]
  img <- data.table::as.data.table(as.data.frame(img))
  img[,channel := factor(cc ,labels=channel.labels)]
  img <- data.table::dcast(img, x+y ~ channel, value.var = "value")
  
  #sort by unique rgb combinations and identify the primary colours
  colours.sorted <- img[, .N, by=list(R,G,B)][order(-N)]
  # because I'm me. 
  k_means<- stats::kmeans(colours.sorted[,1:3], centers = cutoff, iter.max = 30)
  
  #convert to hex
  hex.primaries <- 
    apply(k_means$centers, 1, function(row){
      hex <- grDevices::rgb(row[1], row[2], row[3], maxColorValue=1)
      hex
    })
  hex.primaries
}

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

#list of images
Atonement<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/atonement.jpeg"                    
BigFish<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/big fish.jpeg"                     
ColorOutofSpace<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/Color_Out_of_Space.jpg"            
Dunkirk<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/Dunkirk.jpg"                       
EternalSunshine1<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/eternal sunshine.jpeg"             
EternalSunshine2<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/Eternal_Sunshine2.jpeg"            
Her<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/her.jpeg"                          
Joker1<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/Joker1.jpg"                        
Joker3<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/joker3.jpeg"                       
lalaland<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/lalaland.jpeg"                     
MadMax<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/mad max.jpeg"                      
MarieAntoinette<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/MarieAntoinette.jpeg"              
Melancholia<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/melancholia.jpeg"                  
OnceUponaTimeinHollywood1<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/Once Upon a time in hollywood.jpeg"
OnceUponaTimeinHollywood2<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/once_upon_a_time2.jpeg"            
PromisingYoungWomen<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/promising young women.jpeg"        
RearWindow<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/RearWindow.jpeg"                   
Suspiria<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/suspiria.jpeg"                     
Vertigo2<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/Vertigo1.jpg"                      
Vertigo2<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/vertigo2.jpg"                      
VirginSuicides1<-"GitHub/ImagePaletteR/ImagePaletteR/R/source_images/Virgin_Suicides1.jpeg"
