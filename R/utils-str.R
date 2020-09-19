##' @name string-utilities
##' @rdname string-utilities
##'
##' @title String formatting functions
##'
##' @param x A character vector
##'
##' @return Formatted string or destringed object.
NULL

#' @section Utility function cleaning column names:
#'   As there is no clarity with respect to the returned columns the function:
#'   \itemize{
#'     \item Changes names of known columns like \code{target.instance, target.job}
#'     \item Removes special characters from all columns
#'   }
#' @rdname string-utilities
#' @keywords internal
rename_metadata_data_frame <- function(x) {
  # For columns of known messy values provide replacements
  clean_names <- do.call(what = 'gsub',
                         args = list(
                           x = names(x),
                           pattern = c(".*instance.*"),
                           replacement = c("instance")
                         ))

  clean_names <- do.call(what = 'gsub',
                         args = list(
                           x = clean_names,
                           pattern = c(".*job.*"),
                           replacement = c("job")
                         ))
  # Set names on X
  x <- setNames(object = x, nm = clean_names)
  return(x)
}

#' @section Utility function used to destring value column:
#'   The \code{value} columns should always contain numerical values, the
#'   function ensures that those are returned as of \code{numeric} type.
#' @rdname string-utilities
destring <- function(x) {
  withCallingHandlers(
    expr = {
      if (is.character(x)) {
        as.numeric(x)
      } else if (is.factor(x)) {
        as.numeric(levels(x))[x]
      } else if (is.numeric(x)) {
        x
      }
    },
    warning = function(w) {
      if (startsWith(conditionMessage(w), "NAs introduced by")) {
        invokeRestart("muffleWarning")
        cat("Not all received values were numeric:",
            conditionMessage(w))
      }
    }
  )
}

#' @section Utility function cleaning column names:
#'   As there is no clarity with respect to the returned columns the function:
#'   \itemize{
#'     \item Changes names of known columns like \code{name}
#'     \item Removes special characters from all columns
#'   }
#' @rdname utilities
rename_metrics_data_frame <- function(x) {
  x_names <- names(x)
  if (is.null(x_names)) {
    return(x)
  }
  # For columns of known messy values provide replacements
  clean_names <- do.call(what = 'gsub',
                         args = list(
                           x = x_names,
                           pattern = c(".*name.*"),
                           replacement = c("name")
                         ))
  # Set names on X
  x <- setNames(object = x, nm = clean_names)
  return(x)
}
