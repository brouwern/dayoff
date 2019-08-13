getncbiseq <- function(accession)
{
  #require("seqinr") # this function requires the SeqinR R package
  # first find which ACNUC database the accession is stored in:
  dbs <- c("genbank","refseq","refseqViruses","bacterial")
  numdbs <- length(dbs)
  for (i in 1:numdbs)
  {
    db <- dbs[i]
    seqinr::choosebank(db)
    # check if the sequence is in ACNUC database 'db':
    resquery <- try(sequinR::query(".tmpquery", paste("AC=", accession)), silent = TRUE)
    if (!(inherits(resquery, "try-error")))
    {
      queryname <- "query2"
      thequery <- paste("AC=",accession,sep="")
      seqinr::query(`queryname`,`thequery`)
      # see if a sequence was retrieved:
      seq <- seqinr::getSequence(query2$req[[1]])
      closebank()
      return(seq)
    }
    seqinr::closebank()
  }
  print(paste("ERROR: accession",accession,"was not found"))
}