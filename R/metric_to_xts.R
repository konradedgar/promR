#' Convert Prometheus metric object to xts
#'
#' The function is called via Prometheus query when argument other that
#'   \code{format = "raw"} is passed to the query call. Usually there is no
#'   need to call this function directly.
#'
#' @details The function assumes that the passed object conforms to the raw
#'   Prometheus metric object
#'
#' @param metric_object A data frame returned by Prometheus query
#'
#' @return An xts object
#' @internal
#'
#' @examples
#' \dontrun{
#' metrics_range <- prom$rangeQuery(query = "go_goroutines",
#'                                  start = as.numeric(as.POSIXct(Sys.time() - 600)),
#'                                  end = as.numeric(as.POSIXct(Sys.time())), step = "10s")
#' promR:::metric_to_xts(metrics_range)
#' # Equivalent to
#' #' metrics_range <- prom$rangeQuery(query = "go_goroutines",
#'                                  start = as.numeric(as.POSIXct(Sys.time() - 600)),
#'                                  end = as.numeric(as.POSIXct(Sys.time())), step = "10s",
#'                                  format = "xts")
#' }
metric_to_xts <- function(metric_object) {
  1
}
