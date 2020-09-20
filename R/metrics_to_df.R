#' Convert Prometheus metric object to data frame
#'
#' The function is called via Prometheus query when argument other that
#'   \code{format = "raw"} is passed to the query call. Usually there is no
#'   need to call this function directly.
#'
#' @details The function assumes that the passed object conforms to the raw
#'   Prometheus metric object
#'
#' @param metricsRaw Raw instant or range query metrics object
#'
#' @return An xts object
#' @name mertics_conversions
#' @rdname mertics_conversions
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
metric_to_xts <- function(metricsRaw) {

  # Conversion of raw metrics object to data frame takes place gere

}
