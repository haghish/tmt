
#' @title tombaugh.norm
#' @description the normative data are taken from: Tombaugh, T. N. (2004).
#'              Trail Making Test A and B: normative data stratified by age and education.
#'              Archives of Clinical Neuropsychology, 19(2), 203–214.
#' @param age integer. subjects age in number of years
#' @param education integer. level of education
#' @param tmtA integer. the score of the TMT part A
#' @param tmtB integer. the score of TMT part B
#' @export

tombaugh.norm <- function(age=NULL, education=NULL, tmtA=NULL, tmtB=NULL) {

  # Vector processing
  # ========================================================
  if (length(age) > 1 | length(tmtA) > 1 | length(tmtB) > 1) {
    if (!is.null(tmtA)) {
      if (length(tmtA) != age) {
        stop("length of tmtA is not equal to the age length")
      }
    }
    if (!is.null(tmtB)) {
      if (length(tmtB) != age) {
        stop("length of tmtB is not equal to the age length")
      }
    }

    results = rep(NA, length(age))
    for (i in 1:length(age)) {
      results[i] = tombaugh.norm(age=age[i], education=education[i],
                                 tmtA=tmtA[i], tmtB = tmtB[i])
    }
    return(results)
  }


  # Scalar processing
  # ========================================================

  # Syntax evaluation
  if (!is.null(tmtA) & !is.null(tmtB)) {
    stop("tmtA and tmtB cannot be used together")
  }
  if (is.null(tmtA) & is.null(tmtB)) {
    stop("tmtA or tmtB performance time is needed")
  }

  # fix the education, since it is categorical (up to 12 / above 12)
  if (education <= 12) education = 0
  else education = 1

  # Creating the normative data set for score evaluation
  # --------------------------------------------------------
  norm = data.frame(Age=integer(), Education = integer(),
                    A90=integer(),
                    A80=integer(),
                    A70=integer(),
                    A60=integer(),
                    A50=integer(),
                    A40=integer(),
                    A30=integer(),
                    A20=integer(),
                    A10=integer(),
                    B90=integer(),
                    B80=integer(),
                    B70=integer(),
                    B60=integer(),
                    B50=integer(),
                    B40=integer(),
                    B30=integer(),
                    B20=integer(),
                    B10=integer())

  # for age group between 18-54 no categorization based on
  # education is made
  # --------------------------------------------------------

  # for age group up to 24
  norm[1,] = c(24,1,
               16,17,19,20,22,23,25,27,31,
               35,38,41,44,47,49,54,61,66)

  # for age group between 25-34
  norm[2,] = c(34,1,
               14,17,19,21,23,25,27,33,40,
               33,38,45,48,50,53,58,63,67)

  # for age group between 35-44
  norm[3,] = c(44,1,
               16,20,23,24,26,28,32,36,46,
               40,45,50,53,58,60,62,70,87)

  # for age group between 45-54
  norm[4,] = c(54,1,
               19,23,27,29,31,33,34,38,50,
               42,50,59,62,64,68,72,75,84)

  # for age group between 55-59
  norm[5,] = c(59,0,
               25,27,29,31,32,34,38,40,50,
               56,64,66,71,74,81,87,98,105)
  norm[6,] = c(59,1,
               22,24,25,26,30,32,33,37,53,
               42,56,57,61,65,71,74,81,102)

  # for age group between 60-64
  norm[7,] = c(64,0,
               21,24,26,30,33,37,40,43,45,
               56,58,62,67,72,75,79,92,96)
  norm[8,] = c(64,1,
               22,25,26,27,31,33,35,37,43,
               45,48,53,59,60,66,71,77,87)

  # for age group between 65-69
  norm[9,] = c(69,0,
               24,30,32,36,39,40,44,47,56,
               60,71,74,81,86,93,103,110,137)
  norm[10,] = c(69,1,
                26,28,30,31,32,34,39,40,45,
                52,57,63,67,68,71,73,75,77)

  # for age group between 70-74
  norm[11,] = c(74,0,
                25,30,35,37,38,42,46,52,57,
                70,79,83,95,101,112,124,146,172)
  norm[12,] = c(74,1,
                26,29,31,33,36,41,42,46,71,
                59,63,68,80,84,85,103,109,112)

  # for age group between 75-79
  norm[13,] = c(79,0,
                30,37,39,45,50,53,56,61,72,
                78,92,96,107,120,140,156,167,189)
  norm[14,] = c(79,1,
                22,27,34,37,40,43,46,58,66,
                57,59,66,73,87,105,126,141,178)

  # for age group between 80-74
  norm[15,] = c(84,0,
                31,39,43,49,53,59,66,78,90,
                72,101,112,119,140,154,176,204,259)
  norm[16,] = c(84,1,
                37,38,41,46,48,56,58,64,101,
                89,100,111,113,128,131,139,151,227)

  # for age group between 80-74
  norm[17,] = c(89,0,
                37,39,43,47,55,56,63,72,94,
                89,95,112,132,143,188,194,214,317)
  norm[18,] = c(89,1,
                35,42,49,52,53,60,67,78,125,
                70,81,87,90,121,143,156,212,290)


  # subset the norm data set based on education
  # ========================================================
  if (age >= 55) {
    norm = norm[norm$Education == education, ]
  }

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
