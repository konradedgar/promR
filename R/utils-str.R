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
#' @rdname metric_formats
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
