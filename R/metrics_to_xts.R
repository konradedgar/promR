#' Convert Prometheus metric object to xts
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
#' @keyword internal
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
metrics_to_xts <- function(metricsRaw) {

  # Define conversion function to arrive at xts object
  range_to_xts <- function(x) {

    Metrics_values <- lapply(x$data$result$values, function(x) as.double(x[, 2]))
    Metrics_values <- do.call("cbind", Metrics_values)

    Metrics_timestamps <- as.double(x$data$result$values[[1]][, 1])

    metrics_labels <- x$data$result$metric$job
    colnames(Metrics_values) <- c(metrics_labels)

    xts::as.xts(x = Metrics_values,
                order.by = as.POSIXct(Metrics_timestamps, origin = "1970-01-01"))
  }

  instant_to_xts <- function(metricsRaw) {

  }

  # Check if received metricsRaw object
  checkmate::assert_list(x = metricsRaw, names = "strict", len = 2)

  # Assert metrics type to decide on xts conversion method
  metrics_type <- metrics_type_check(metricsRaw)

  # Deploy desired conversion function
  switch(metrics_type,
         range = range_to_xts(x = metricsRaw),
         instant = instant_to_xts(metricsRaw))
}
