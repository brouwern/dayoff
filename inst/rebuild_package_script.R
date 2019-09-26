# vignettes
devtools::clean_vignettes()
devtools::build_vignettes()

devtools::load_all(".")


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


