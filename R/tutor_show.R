#' Show the tutorials currently available for the dayoff package
#'
#'
#' @export

tutor_show <- function(){
  dayoff.path <- system.file(package = "dayoff")
  tutor.path <- paste0(dayoff.path,"/tutorials")
  list.files(tutor.path)
}
