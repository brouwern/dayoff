generatemarkovseq <- function(transitionmatrix, initialprobs, seqlength)
{
  nucleotides     <- c("A", "C", "G", "T") # Define the alphabet of nucleotides
  mysequence      <- character()           # Create a vector for storing the new sequence
  # Choose the nucleotide for the first position in the sequence:
  firstnucleotide <- sample(nucleotides, 1, rep=TRUE, prob=initialprobs)
  mysequence[1]   <- firstnucleotide       # Store the nucleotide for the first position of the sequence
  for (i in 2:seqlength)
  {
    prevnucleotide <- mysequence[i-1]     # Get the previous nucleotide in the new sequence
    # Get the probabilities of the current nucleotide, given previous nucleotide "prevnucleotide":
    probabilities  <- transitionmatrix[prevnucleotide,]
    # Choose the nucleotide at the current position of the sequence:
    nucleotide     <- sample(nucleotides, 1, rep=TRUE, prob=probabilities)
    mysequence[i]  <- nucleotide          # Store the nucleotide for the current position of the sequence
  }
  return(mysequence)
}
