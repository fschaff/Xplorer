#' Browse Dataset
#' @description
#' Browse through your dataset by searching variable names and labels via the search field.
#' Browser shows variable details such as names, labels, range, distinct values, class, typeof, non-missing cases and missing cases.
#' @param x The dataset to be opened in the Viewer.
#' @keywords browse browser variable variables
#' @importFrom stats median na.omit sd var
#' @import utils
#' @examples
#' # create data.frame
#' numeric <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
#' labelled.numeric <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
#' attributes(labelled.numeric)$label <- "my.variable.label"
#' df <- data.frame(numeric, labelled.numeric)
#' # View(df)

#' @export
browse <- function(x) {
  variable.name <- names(x)
  variable.label <- cbind(lapply(x,
                                 function(y) {
                                   if (is.null(attributes(y))) { c("-") }
                                   else if (!is.null(attributes(y)$label)) { as.character(attributes(y)$label) }
                                 }))
  distinct.values <- cbind(lapply(x, function(y) {length(table(y))} ))
  range <- cbind(lapply(x,
                        function(y) {
                          if (is.character(y)) { c("-") }
                          else if (is.factor(y)) { c("-") }
                          else if (is.numeric(y)) { range(y, na.rm = TRUE, finite = TRUE)}
                          else c(NA_character_)
                        }))
  N <- colSums(!is.na(x))
  missings <- colSums(is.na(x))
  class <- cbind(lapply(x, function(y) {class(y)} ))
  typeof <- cbind(lapply(x, function(y) {typeof(y)} ))
  data.frame <- data.frame(variable.name, variable.label, range, distinct.values, class, typeof, N, missings)
  row.names(data.frame) <- NULL
  return(data.frame)
  }












