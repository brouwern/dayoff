devtools::clean_vignettes()
devtools::build_vignettes()
devtools::document(roclets=c('rd', 'collate', 'namespace'))
devtools::load_all(".")
devtools::check() # = "check package" on GUI, = R CMD check?


pkgdown::build_site()


system("git add .")
system("git commit -m package 'rebuild'")
system("git push")


