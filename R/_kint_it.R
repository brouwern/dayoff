library(knitr)

getwd()

list.dirs(full.names = F,
          recursive  = T,
          path = getwd())

dir. <-here::here("inst/tutorials")
fi. <- here::here("inst/tutorials/AC04-01-vectors.Rmd")
list.files(fi.)
file.exists(fi.)
knit(input = )
