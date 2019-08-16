retrieveseqs <- function(seqnames,acnucdb)
{
  myseqs <- list()   # Make a list to store the sequences
  require("seqinr")  # This function requires the SeqinR R package
  choosebank(acnucdb)
  for (i in 1:length(seqnames))
  {
    seqname <- seqnames[i]
    print(paste("Retrieving sequence",seqname,"..."))
    queryname <- "query2"
    query <- paste("AC=",seqname,sep="")
    query(`queryname`,`query`)
    seq <- getSequence(query2$req[[1]]) # Makes a vector "seq" containing the sequence
    myseqs[[i]] <- seq
  }
  closebank()
  return(myseqs)
}
