#' Browse Dataset
#' @description
#' Browse through your dataset by searching variable names and labels via the search field.
#' Browser shows variable details such as names, labels, range, distinct values, class, typeof, non-missing cases and missing cases.
#' @param x The dataset to be opened in the Viewer.
#' @keywords browse browser variable variables
#' @importFrom Hmisc label
#' @importFrom stats median na.omit sd var
#' @import utils
#' @examples
#' # create data.frame
#' numeric <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
#' labelled.numeric <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
#' attr(labelled.numeric, "label") <- "my.variable.label"
#' df <- data.frame(numeric, labelled.numeric)
#'
#' # open data.frame in Viewer window

#' @export
browse <- function(x) {
  variable.name <- names(x)
  if (inherits(x, "labelled"))
    variable.label <- Hmisc::label(x)
  else if (!inherits(x, "labelled"))
    variable.label <- cbind(lapply(x, function(y) {c("-")}))
  distinct.values <- cbind(lapply(x, function(y) {length(table(y))} )) # shows number of distinct values without NA
  range <- cbind(lapply(x,
                        function(y) {
                          if (is.character(y)) { c("-") }
                          else if (is.factor(y)) { c("-") }
                          else if (is.numeric(y)) { range(y, na.rm = TRUE, finite = TRUE)}
                          else c("Something went wrong.")
                        }))
  N <- colSums(!is.na(x))
  missings <- colSums(is.na(x))
  class <- cbind(lapply(x, function(y) {class(y)} ))
  typeof <- cbind(lapply(x, function(y) {typeof(y)} ))
  data.frame <- data.frame(variable.name, variable.label, range, distinct.values, class, typeof, N, missings)
  row.names(data.frame) <- NULL
  assign(paste0("browse.", deparse(substitute(x))), data.frame, envir = .GlobalEnv)
  message("The data was saved as '", paste0("browse.", deparse(substitute(x))), "' in the global environment. Open it in the Viewer with View(", paste0("browse.", deparse(substitute(x)), ")."))
  }












