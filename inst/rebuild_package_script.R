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

# update version number
ver <- desc::desc_get_version()
new_ver <- usethis:::bump_version(ver = ver)["dev"]
usethis:::use_description_field("Version", new_ver, overwrite = TRUE)

system("git add .")
system("git commit -m 'update'")
system("git push")


