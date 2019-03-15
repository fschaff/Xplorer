#' Display Variable Details for all variables in a data.frame
#' @description This function displays the following details of each variable:
#' \itemize{
#'  \item{attributes (i.e. useful to inspect labels)}
#'  \item{class, typeof, mode, storage.mode}
#'  \item{table (frequency and percentage of values)}
#'  \item{summary statistics}
#' }
#' See is an S3 generic and currently works with objects of class 'character', 'factor', 'numeric', 'data.frame', 'labelled', 'haven_labelled', 'POSIXct' and 'Date'.
#'
#' @param x The data.frame to be displayed in the console.
#' @keywords see codebook
#' @import crayon
#' @examples
#' see_all(mtcars)



#' @export
see_all <- function(x) {
  for (i in colnames(x)){
    cat("\n\n")
    cat(crayon::blue(paste0(deparse(substitute(x)))),
        crayon::yellow("$"),
        crayon::red(colnames(x[i])),
        sep = "")
    cat("\n\n")
    see(x[[i]])
    cat("\n")
  }
}
