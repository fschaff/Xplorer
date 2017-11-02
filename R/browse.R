#' Browse Dataset
#' @description
#' Browse through your dataset by searching variable names and labels via the search field.
#' Browser shows variable details such as names, labels, range, distinct values, class, typeof, non-missing cases and missing cases.
#' @param x The dataset to be opened in the Viewer.
#' @keywords browse browser variable variables
#' @import stats
#' @import utils
#' @examples
#' # Either call browse() on a data.frame directly...
#' browse(mtcars)
#'
#' # ...or assign and open with View():
#' df <- browse(mtcars)
#' # View(df)

#' @export
browse <- function(x) {

  # test if x is a data.frame
  if (!is.data.frame(x))
    stop("x is not a data.frame")

  # create output
  variable.name <- names(x)
  variable.label <- cbind(lapply(x,
                                 function(y) {
                                   if (is.null(attributes(y))) { c("-") }
                                   else if (!is.null(attributes(y)$label)) { as.character(attributes(y)$label) }
                                 }))
  range <- cbind(lapply(x,
                        function(y) {
                          if (is.character(y)) { c("-") }
                          else if (is.factor(y)) { c("-") }
                          else if (is.numeric(y)) { range(y, na.rm = TRUE, finite = TRUE)}
                          else c(NA_character_)
                        }))
  distinct.values <- cbind(lapply(x, function(y) {length(table(y))} ))
  class <- cbind(lapply(x, function(y) {class(y)} ))
  typeof <- cbind(lapply(x, function(y) {typeof(y)} ))
  N <- colSums(!is.na(x))
  missings <- colSums(is.na(x))
  output <- data.frame(variable.name, variable.label, range, distinct.values, class, typeof, N, missings)
  row.names(output) <- NULL

  # return output
  return(output)
  }












