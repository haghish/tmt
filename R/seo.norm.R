
#' @title seo.norm
#' @description the normative data are taken from:
#'              Seo et. al. (2006). A normative study of the
#'              Train Making Test in Korean elders.
#'              International Journal of Geriatric
#'              Psychology, 21, 844–852. the normaive data
#'              is printed in the page 850
#'
#' @param age integer. age in number of years. these norms are
#'            intended for individuals from 60 years old and
#'            above
#' @param education integer. number of years of education. the
#'                  norms include three categories based on
#'                  education which are 1) below or equal to 6 years,
#'                  2) below or equal to 9, and 3) 10 or above
#' @export

seo.norm <- function(age, education, tmtA=NULL, tmtB=NULL) {

  # Syntax evaluation
  # ========================================================
  if (!is.null(tmtA) & !is.null(tmtB)) {
    stop("tmtA and tmtB cannot be used together")
  }
  if (is.null(tmtA) & is.null(tmtB)) {
    stop("tmtA or tmtB performance time is needed")
  }

  #evaluate age
  if (age < 60) stop("the selected norms are for individuals above 60 years old")

  # the norms provides 4 groups based on level of education.
  if (education <= 6) education = 1
  else if (education <= 9) education = 2
  else if (education >= 10) education = 3

  # Creating the normative data set for score evaluation
  # ==========================================================
  norm = data.frame(Age=integer(), Education = integer(),
                    meanA=numeric(),
                    sdA  =numeric(),
                    A5   =integer(),
                    A50  =integer(),
                    A95  =integer(),
                    meanB=numeric(),
                    sdB  =numeric(),
                    B5   =integer(),
                    B50  =integer(),
                    B95  =integer(), Brate  =numeric())

  # Norms for different age groups but education level 1
  # --------------------------------------------------------
  # for age group up to 69
  norm[1,] = c(69,1,
               77.75,29.57,39,73.5,143.15,
               201.85,55.1,108.45,198.5,291.8,39.4)

  # for age group between 70-74
  norm[2,] = c(74,1,
               79.06,29.78,39,74,146.5,
               202.34,55.29,104.65,197,290.65, 37.4)

  # for age group between 75-79
  norm[3,] = c(79,1,
               76.35,27.39,40,69,125.5,
               201.43,55.54,102.50,196,290.5,33)

  # for age group between 80-90
  norm[4,] = c(90,1,
               84.05,27.06,50,83.5,156.6,
               217.27,53.97,99.35,220.5,290.85,23.4)






  # subset the norm data set based on education and age
  # ========================================================
  norm = norm[norm$Education == education, ]
  ageIndex = min(which(norm$Age >= age))
  norm = norm[ageIndex, ]


  if (!is.null(tmtA)) {
    A <- cbind(norm[, c("A10","A20","A30","A40","A50","A60","A70","A80","A90")])

    # check if the value equals the norm
    score = which(A == tmtA)

    if (length(score) == 0) {
      score = suppressWarnings(max(which(A > tmtA)))
      if (score == -Inf) score = 1
      return(score*10)

    } else {
      return(score*10)
    }
  }

  if (!is.null(tmtB)) {
    B <- cbind(norm[, c("B10","B20","B30","B40","B50","B60","B70","B80","B90")])

    # check if the value equals the norm
    score = which(B == tmtB)

    # if the value is not in the list, then start the process
    # otherwise return the norm

    if (length(score) == 0) {
      score = suppressWarnings(max(which(B > tmtB)))
      if (score == -Inf) score = 1
      return(score*10)

    } else {
      return(score*10)
    }
  }
}
