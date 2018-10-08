
#' @title tmt
#' @description runs the tmt app


tmt <- function() {

  suppressPackageStartupMessages({
    require(shiny)
    require(shinyjs)
  })


  path = system.file("Apps/Main/", "server.R", package="tmt")
  path = dirname(path)
  a = runApp(appDir = path, host="0.0.0.0",port=5555)
}
