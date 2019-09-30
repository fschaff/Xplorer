#' Display Variable Details for a selction of variables in a data.frame
#' @description This function displays the following details of each variable:
#' \itemize{
#'  \item{attributes (i.e. useful to inspect labels)}
#'  \item{class, typeof, mode, storage.mode}
#'  \item{table (frequency and percentage of values)}
#'  \item{summary statistics}
#' }
#' See is an S3 generic and currently works with objects of class 'character', 'factor', 'numeric', 'data.frame', 'labelled', 'haven_labelled', 'POSIXct' and 'Date'.
#' @param data The data.frame from which variables are selected.
#' @param variables The variables that should be displayed, in quotes.
#' @keywords see codebook
#' @import crayon
#' @examples
#' see_at(mtcars, variables = c("cyl", "mpg"))



#' @export
see_at <- function(data, variables) {
  for (i in variables){
    cat("\n\n")
    cat(crayon::blue(paste0(deparse(substitute(data)))),
        crayon::yellow("$"),
        crayon::red(colnames(data[i])),
        sep = "")
    cat("\n\n")
    see(data[[i]])
    cat("\n")
  }
}




