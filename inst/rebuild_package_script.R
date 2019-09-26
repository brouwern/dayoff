# vignettes
devtools::clean_vignettes()
devtools::build_vignettes()

# documents
devtools::document(roclets=c('rd', 'collate', 'namespace'))


devtools::load_all(".")

# check
devtools::check() # = "check package" on GUI, = R CMD check?


# pkgdown
pkgdown::build_site()


system("git add .")
system("git commit -m 'x'")
system("git push")


