#' Scalars in R
#'
#' Scalars in computating are variables that contain only a single numeric value.  Technically in R
#' there are no scalars, but rather vectors with a length of 1.
#'
#' Note that in R vectors of any size are literally 1 dimensional; they only have length.
#'
#' http://adv-r.had.co.nz/Data-structures.html
#'
#' @examples
#' x <- 1
#' is.vector(x) # x is a vector
#' dim(x)       # x doesn't have a dimension
#' length(x)    # x does does a length
#'
#' x <- "a"
#' is.vector(x) # vectors can contain character data
#'
