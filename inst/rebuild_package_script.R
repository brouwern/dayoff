devtools::load_all(".")

# vignettes
devtools::clean_vignettes()
devtools::build_vignettes()




# clean up tutorial knitr files
dir. <-here::here("inst/tutorials")
fi. <- here::here("inst/tutorials/AC04-01-vectors.Rmd")
list.dirs(dir.)
file.exists(fi.)

subdirs.all  <- list.dirs(dir.,recursive = F,full.names = F)
files.html <- list.files(dir.,pattern = "html")
file.remove(here::here("inst/tutorials",files.html))
unlink(here::here("inst/tutorials",subdirs.all), recursive = T)



# pkgdown
pkgdown::build_site()

# update version number
ver <- desc::desc_get_version()
new_ver <- usethis:::bump_version(ver = ver)["dev"]
usethis:::use_description_field("Version", new_ver, overwrite = TRUE)

# documents
## name space
devtools::document(roclets=c('rd', 'collate', 'namespace'))



# check
devtools::check() # = "check package" on GUI, = R CMD check?



system("git add .")
system("git commit -m 'update'")
system("git push")


