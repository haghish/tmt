#' @title plot_curve
#' @description draws the TMT plot in the shiny app
#' @param v this argument is automatically specified by the
#'          Shiny app
#' @param norm the normative data. currently, only \code{"tombaugh"}
#'             is implemented
#' @param test character. This argument is specified by the
#'             shiny app automatically
#' @importFrom graphics curve polygon abline axis
#' @importFrom stats dnorm
#' @export
#' @importFrom grDevices topo.colors
#' @importFrom utils globalVariables


plot_curve = function(v=NULL, norm="tombaugh", test=NULL) {

  #x = globalVariables(x)

  FUN = function(x) {
    dnorm(x,50,15)
  }

  if (norm == "tombaugh") {
    curve(FUN,xlim=c(4,96),
          main=paste(test,'normative analysis based on Tombaugh (2004) norms'),
          xlab = "relative performance (from low 10% to top 90%)",
          ylab = "", yaxt='n',
          lwd = 1,
          col="black")
    axis(1, at = seq(10,90,10))

    # shading multiple polygons
    SEQ = seq(4,10,1)
    cord.x1 <- c(4,SEQ,10)
    cord.y1 <- c(0,dnorm(SEQ,50,15),0)

    SEQ = seq(10,20,1)
    cord.x2 <- c(10,SEQ,20)
    cord.y2 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(20,30,1)
    cord.x3 <- c(20,SEQ,30)
    cord.y3 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(30,40,1)
    cord.x4 <- c(30,SEQ,40)
    cord.y4 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(40,50,1)
    cord.x5 <- c(40,SEQ,50)
    cord.y5 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(50,60,1)
    cord.x6 <- c(50,SEQ,60)
    cord.y6 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(60,70,1)
    cord.x7 <- c(60,SEQ,70)
    cord.y7 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(70,80,1)
    cord.x8 <- c(70,SEQ,80)
    cord.y8 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(80,90,1)
    cord.x9 <- c(80,SEQ,90)
    cord.y9 <- c(0,dnorm(SEQ, 50,15),0)

    SEQ = seq(90,96,1)
    cord.x10 <- c(90,SEQ,96)
    cord.y10 <- c(0,dnorm(SEQ, 50,15),0)


    # brewing color for continious color filling
    #library(RColorBrewer)
    # plotclr <- brewer.pal(10,"YlOrRd")
    plotclr = rev(topo.colors(10, alpha = .5))
    # plotclr = rainbow(10, alpha = .5)


    polygon(cord.x1,cord.y1,col=plotclr[1], border = NA )
    polygon(cord.x2,cord.y2,col=plotclr[2], border = NA )
    polygon(cord.x3,cord.y3,col=plotclr[3], border = NA )
    polygon(cord.x4,cord.y4,col=plotclr[4], border = NA )
    polygon(cord.x5,cord.y5,col=plotclr[5], border = NA )
    polygon(cord.x6,cord.y6,col=plotclr[6], border = NA )
    polygon(cord.x7,cord.y7,col=plotclr[7], border = NA )
    polygon(cord.x8,cord.y8,col=plotclr[8], border = NA )
    polygon(cord.x9,cord.y9,col=plotclr[9], border = NA )
    polygon(cord.x10,cord.y10,col=plotclr[10], border = NA )

    curve(FUN,xlim=c(4,96),
          lwd = 1,
          add = TRUE)

    if (!is.null(v)) {
      abline(v=v, col="red", lwd=5)
    }
  }
}
