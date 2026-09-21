#' Calculate shortest path distances using Dijkstra's algorithm
#'
#' Dijkstra's algorithm finds the shortest path distances from one
#' initial node to all other nodes in a directed weighted graph.
#'
#' @param graph A \code{\link[base]{data.frame}} representing the graph.
#' Each row represent an edge and the data fram must contain the following
#' columns:
#' \describe{
#'    \item{\code{v1}}{A \code{vector} containing start nodes}
#'    \item{\code{v2}}{A \code{vector} containing destination nodes}
#'    \item{\code{w}}{A \code{vector} containing the weights from v1_i to v2_i}
#' }
#' All edge weights must be non-negative.
#'
#' @param init_node An integer specifying the initial node from which
#' shortest path distances are calculated. The node must occur in either
#' \code{v1} or \code{v2}.
#'
#' @return A numeric \code{\link[base]{vector}} containing the shortest
#'  path distance from \code{init_node} to all other nodes.
#'
#' @references
#' \url{https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm}
#'
#' @examples
#' data(wiki_graph)
#' dijkstra(wiki_graph, 1)
#' dijkstra(wiki_graph, 6)
#' @export
#'
dijkstra <- function(graph, init_node) {
  stopifnot(
    is.data.frame(graph),
    identical(colnames(graph), c("v1", "v2", "w")),
    init_node %in% union(graph$v1, graph$v2),
    graph$w >= 0
  )

  node_count <- length(unique(union(graph$v1, graph$v2)))

  distance <- rep(Inf, node_count)
  previous <- rep(0, node_count)

  distance[init_node] <- 0

  unvisited_nodes <- unique(graph$v1)

  while (length(unvisited_nodes) > 0) {
    u <- unvisited_nodes[which.min(distance[unvisited_nodes])]
    unvisited_nodes <- unvisited_nodes[unvisited_nodes != u]

    edge_indices <- which(graph$v1 == u)
    neighbours <- graph$v2[edge_indices]
    alt <- graph$w[edge_indices] + distance[u]
    is_shorter <- alt < distance[graph$v2[edge_indices]]
    distance[neighbours[is_shorter]] <- alt[is_shorter]
    previous[neighbours[is_shorter]] <- u
  }
  return(distance)
}
