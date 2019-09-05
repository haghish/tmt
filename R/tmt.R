
#' @title tmt
#' @description runs the tmt shiny app
# @importFrom shiny runApp
#' @importFrom  shiny runApp
#' @export

tmt <- function() {

  #suppressPackageStartupMessages({
  #  requireNamespace(shiny)
  #})


  path = system.file("Apps/Main/", "server.R", package="tmt")
  path = dirname(path)
  a = runApp(appDir = path, host="0.0.0.0",port=5555)
}
