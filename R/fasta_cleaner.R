#' Function to convert a FASTA file stored as an object into a vector
#'
#' @examples
#'
#' header. <- ">NC_001477.1 Dengue virus 1, complete genome"
#' fasta_cleaner(dengueseq_fasta, header = header.)
#'
#'
#' fasta_cleaner <- function(fasta_object, header){
#'         fasta_object <- gsub("\n", "", fasta_object)
#'         fasta_object <- gsub(header, "", fasta_object)
#'         fasta_object <- stringr::str_split(fasta_object,
#'                                   pattern = "",
#'                                   simplify = FALSE)
#'         return(fasta_object[[1]])
#' }
