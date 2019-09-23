# Make Dayhoff matrices from Tables in Pevsner chapter3


# #library("rJava")
# #library("tabulizer")
# #library("here")
# list.files()
# f <- system.file("examples", "data.pdf", package = "tabulizer")
#
# # page 13
# tab <- extract_tables(here("data-raw/pevsner3.pdf"), pages = 13)
# pams <- tab[[1]]
# write.csv(tab[[1]],file = here("data-raw/pevsner3_fig3_8.csv"))
#
# pams.rownames <- pams[,1]
# pams.colnames <- pams[1,]
#
# drop.rows <- c(1,2,nrow(pams)-1,nrow(pams))
# pams2 <- pams[-drop.rows,-1]
# pams2[grep("[a-zA-Z]",pams2)] <-0
# pams.dat <- data.frame(pams2)
# for(i in 1:ncol(pams.dat)){
#   pams.dat[,i] <- as.numeric(pams.dat[,i])
# }
#
#
# names(pams.dat) <- pams.rownames[-c(1:2,23,24)]
# rownames(pams.dat) <- pams.rownames[-c(1:2,23,24)]
#
#
#
# aa_freq <- data.frame(aa        = c(tab[[2]][ ,1 ],tab[[2]][ ,3]),
#                        frequency = c(tab[[2]][ ,2 ],tab[[2]][ ,4]),
#                       stringsAsFactors = F)
# aa_freq$frequency <- as.numeric(aa_freq$frequency)
# library(ggpubr)
#
# gghistogram(data = aa_freq,
#             x = "frequency")
#
#
# # page 14
# tab <- extract_tables(here("data-raw/pevsner3.pdf"), pages = 14)
#
# aa_mut <- data.frame(aa        = c(tab[[1]][ ,1 ],tab[[1]][ ,3]),
#                       mutability = c(tab[[1]][ ,2 ],tab[[1]][ ,4]),
#                       stringsAsFactors = F)
# aa_mut$mutability <- as.numeric(aa_mut$mutability)
# gghistogram(data = aa_mut,
#             x = "mutability")
#
#
#
# # page 16
# tab <- extract_tables(here("data-raw/pevsner3.pdf"), pages = 16)
# write.csv(tab[[1]],file = here("data-raw/pevsner3_fig3_9.csv"))
#
#
# # page 16
# tab <- extract_tables(here("data-raw/pevsner3.pdf"), pages = 20)
# write.csv(tab[[1]],file = here("data-raw/pevsner3_fig3_13.csv"))
#
#
#
# # page 22
# tab <- extract_tables(here("data-raw/pevsner3.pdf"), pages = 22)
# write.csv(tab[[1]],file = here("data-raw/pevsner3_fig3_14.csv"))
#
#
# # page 23
# tab <- extract_tables(here("data-raw/pevsner3.pdf"), pages = 23)
# write.csv(tab[[1]],file = here("data-raw/pevsner3_fig3_15.csv"))
#
#
#


# Figure 3.8 page 81 / Figure 80 Dayhoff et al 1978 (?)
## values multiplied by 10



fi. <- here::here("data-raw","pevsner3_fig3_8.csv")
pams <- read.csv(fi., stringsAsFactors = F)

j.drop <- c(1,2)
i.drop <- c(1,2,
            nrow(pams)-1,
            nrow(pams))

letter3 <- pams[2,-j.drop]
letter1 <- pams[1,-j.drop]
length(letter3) == length(letter1)
length(letter3)

pams <- pams[-i.drop, -j.drop]
dim(pams)
names(pams) <- letter3
dim(pams)

rownames(pams) <- as.vector(letter1)

#Fix type
pams["L","Cys"] <- 0
for(i in 1:ncol(pams)){
  pams[,i] <- as.numeric(pams[,i])
}

pams <- cbind(t(letter3), pams)
names(pams)[1] <- "code"


pams2 <- pams[,-1]

pams2[is.na(pams2)] <-0

pams2 <- pams2 + t(pams2)

mutablity <- apply(pams2,2,sum)

mutablity.relative <- mutablity/3644*100
mutablity.relative[order(mutablity.relative)]



freq <- c(0.089,0.087,0.085,0.081,0.070,0.065,0.058,0.051,0.050,0.047,0.041,0.040,0.038,0.037,0.034,0.033,0.030,0.015,0.010)

hist(freq)



library(reshape2)

pams.long <- na.omit(melt(data = pams, variable.name = "code.column",value.name = "mutations"))
dim(pams.long)
summary(pams.long)
hist(pams.long$value)

library(ggpubr)
gghistogram(data = pams.long, x= "mutations", add = "mean")

#why no diagonal
#why


i.val <- which(pams.long$code == "Val" | pams.long$code.column == "Val")
length(i.val)
