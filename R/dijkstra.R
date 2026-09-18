dijkstra <- function(graph, init_node) {
  stopifnot(
    is.data.frame(graph),
    identical(colnames(graph), c("v1", "v2", "w")),
    init_node %in% union(graph$v1, graph$v2)
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
