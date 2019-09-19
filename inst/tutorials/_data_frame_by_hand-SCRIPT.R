library(ggpubr)
org <- c("M13","lamb", "T2", "T4",rep("EC",3),rep("SC",3),rep("NC",2))
G.p <- c(6.41, 4.85,    1.60, 1.66, 4.70, 4.70, 4.70, 1.38, 1.38, 1.38, 4.19, 4.19)
u.bp <- u.bp.p*10^u.bp.exp
u.g.2 <- u.bp*G
table1$log10.u.bp <- log10(table1$u.bp)
table1$log10.u.g <- log10(table1$u.g)
