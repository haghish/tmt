
#' @export

tmt_interpret = function(test=NULL, norm = "tombaugh", score=NULL) {
  results = NULL
  if (!is.null(score)) {

    # Tombaugh
    # ------------------------------------------------------
    if (norm == "tombaugh") {
      if (score == 10) {
        results = paste("the subject is performing poorly",
                        "and is within the lowest",
                        paste0(score,"%"), "of the population")
      } else if (score <30) {
        results = paste("the subject is performing lower",
                        "than average and within the lower",
                        paste0(score,"%"), "of the population")
      } else if (score < 50) {
        results = paste("the subject is performing lower",
                        "than average but better than",
                        paste0(score,"%"), "of the population")
      } else if (score == 50) {
        results = paste("the subject's performance is",
                        "average, better than",
                        paste0(score,"%"), "of the population")
      } else {
        results = paste("the subject is performance is",
                        "good, within the top",
                        paste0(score,"%"), "of the population")
      }
    }

  }

  return(results)
}
