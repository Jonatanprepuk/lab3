#' Calculate the greatest common divisor using the Euclidean algorithm
#'
#' The Euclidean algorithm calculates the greatest common divisor
#' of two numbers by repeatedly replacing the larger number with the
#' remainder obtained when dividing the larger number by the smaller one.
#' This process continues until the remainder is zero. The last non-zero
#' remainder is the greatest common divisor.
#'
#' @param M A numeric value of length one containing the first number.
#' @param N A numeric value of length one containing the second number.
#'
#' @return The greatest common divisor of M and N.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
#'
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)
#'@export
#'
euclidean <- function(M, N) {
  stopifnot(is.numeric(c(M, N))) #  Stop if either parameter is not numeric
  M <- abs(M)
  N <- abs(N)
  if (M < N) { #  Swap M and N if M is smaller
    m <- N
    n <- M
  } else {
    m <- M
    n <- N
  }
  remainder <- NA
  while (n != 0) {
    remainder <- m %% n
    m <- n
    n <- remainder
  }
  return(m)
}