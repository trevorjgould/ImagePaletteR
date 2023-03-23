#' list of palattes already made
#' 
#' @export
Cinema_palette <- c(
atonement<-c("#951713","#8A6750","#702A19","#49351E","#B1594A","#6B4F37","#B67D67","#D7D2B2","#BDA184","#9A3E30"),
bigfish<-c("#A79EBB","#E0CDCE","#592C1F","#84738C","#4B3E3F","#CFA58A","#75493A","#685367","#2E2517","#9A6F59"),
ColorOutofSpace<-c( "#36163A","#A0128B","#C82AAD","#6C0F65","#85359B","#6D7492","#DD68D3","#B851BC","#46466C","#ED9CEB"),
Dunkirk<-c("#A9502D","#678076","#863D26","#5D2A1A","#D1C9A6","#235B5B","#ACA388","#321A0D","#C7723A","#0D1C19"),
eternalsunshine<-c("#593833","#26303F","#6F4E4E","#3B4D61","#C5CACE","#82676E","#3C231C","#141216","#536D84","#828492"),
Joker1<-c("#1D161E","#781E16","#B47F6D","#BB3717","#54969A","#13909C","#242E45","#7B5456","#0F5372","#9FCCBE"),
Joker3<-c("#5E7B62","#141F19","#5C5138","#E5E8CF","#A28C65","#2D5C4F","#829D7D","#323A2D","#C2B98C","#8A653C"),
lalaland<-c("#573116","#14161D","#906A6B","#233D71","#60678D","#856719","#888EAD","#594C57","#BE9A9F","#2B2E3E"),
madmax<-c("#471B06","#AF6447","#EFA777","#A2490E","#732B08","#CF6817","#DE8847","#FBCDAB","#815247","#C88263"),
hollywood<-c("#5F3622","#3C2A1F","#764E34","#6E615E","#C1B8AD","#8D6744","#F9F9F4","#201710","#51463D","#96806F"),
promisingyoungwomen<-c("#5C604A","#37625B","#0C1615","#9A938F","#3A4638","#0C3A41","#0F8C8D","#657C78","#0D6060","#262C22"),
Vertigo1<-c("#A0877C","#191410","#946855","#774B3B","#464B44","#441813","#5F2F27","#D6CABF","#6D6460","#2E322B"),
Vertigo2<-c("#293931","#0CBF82","#0A7B46","#0C100D","#43574A","#09361B","#1D1E21","#0B9B5D","#19EFC6","#0A5931")
)

#' script from: https://github.com/karthik/wesanderson/blob/master/R/colors.R
cinema_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- cinema_palette[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
