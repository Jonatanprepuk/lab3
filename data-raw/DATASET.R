## code to prepare `DATASET` dataset goes here
#' Example graph to test dijkstra's algorithm
#' @format ## `wiki_graph`
#' A data frame with 18 rows and 3 columns:
#' \describe{
#'   \item{v1}{Start vertex}
#'   \item{v2}{End vertex}
#'   \item{w}{weight}
#' }
#' @source <https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm>
wiki_graph <-
  data.frame(
    v1 = c(1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6),
    v2 = c(2, 3, 6, 1, 3, 4, 1, 2, 4, 6, 2, 3, 5, 4, 6, 1, 3, 5),
    w = c(7, 9, 14, 7, 10, 15, 9, 10, 11, 2, 15, 11, 6, 6, 9, 14, 2, 9)
  )
usethis::use_data(DATASET, overwrite = TRUE)
