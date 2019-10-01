#' Show the tutorials currently available for the dayoff package
#'
#' @examples
#' tutor_show()
#'
#'
#' @export

tutor_show <- function(){
  dayoff.path <- system.file(package = "dayoff")
  tutor.path <- paste0(dayoff.path,"/tutorials")
  print(paste("Files in:", tutor.path))
  print("RMarkdown (.Rmd) files:")
  data.frame(file = list.files(tutor.path,pattern = ".Rmd$"))
  cat("\n R script (.R) files:")
  data.frame(file  = list.files(tutor.path,pattern = ".R$"))
}
