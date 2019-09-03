install.packages("tabulizer")
install.packages("tabulizerjars")
install.packages("rJava")
library("rJava")
library("tabulizer")
list.files()
f <- system.file("examples", "data.pdf", package = "tabulizer")

# extract table from first page of example PDF
tab <- extract_tables("extract_me.pdf", pages = 6)

head(tab[[1]])
str(tab)

#write.csv(tab, file = "Higgs_2009_amino_acids_properties.csv")
