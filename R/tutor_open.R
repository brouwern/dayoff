#' Open a specified tutorial file
#'
#' @param tutorial name of tutorial to open
#'
#' @examples
#' tutor_open()
#'
#' @export

tutor_open <- function(tutorial = NULL){
  dayoff.path <- system.file(package = "dayoff")
  tutor.path <- paste0(dayoff.path,"/tutorials")

  if(is.null(tutorial) == TRUE){
    tutorial <- list.files(tutor.path)[1]
    warning("No tutorial specified, SAMPLE TUTORIAL OPENED")
  }

  #construct path to tutorial
  tutor.file.path <- paste0(tutor.path,"/",tutorial)

  if(file.exists(tutor.file.path) == FALSE){
   stop(cat("Sorry, file ", tutorial, "does not exist.  \nUse the function tutor_show() to see a list of available tutorials "))

  }


  message("Opening: ",tutor.file.path)


  system.string <- paste("RStudio", tutor.file.path)


  system(system.string)
}
