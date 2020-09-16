#' @importFrom methods setOldClass
#' @exportClass promMetric
setOldClass(c("data.frame"))

#' The \code{promMetric} class extends \code{data.frame} class
#'
#' The \code{promMetric} extends \code{\link[base]{data.frame}} class by
#'   providing convenience implementation for \code{\link[xts]{as.xts}}
#'   exported from the \code{\link[xts]{xts}} package.
#'
#' @slot query Original query string
#' @slot query_type A character scalar reflecting query type
#' @slot res_data Data frame with results
setClass(
  "promMetric",
  slots = c(query = "character",
            query_type = "character"),
  contains = "data.frame"
)

# Helper
promMetric <- function(res_data, query, query_type) {
  new("promMetric",
      res_data,
      query = query,
      query_type = query_type)
}

# TODO: Write as_xts

# Show method
#' @importFrom cli cli_h1 style_bold cat_line
setMethod("show", "promMetric", function(object) {
  # TODO: Prettify
  cli_h1("Prometheus {object@query_type} query")
  cat_line(style_bold("Some info on the query"))
  print(head(object))
})
