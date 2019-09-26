devtools::clean_vignettes()
devtools::build_vignettes()
devtools::document(roclets=c('rd', 'collate', 'namespace'))
devtools::load_all(".")
devtools::check()
pkgdown::build_site()

vs.current <- desc::desc_get_version(proj_get())
vs.new <- usethis:::bump_version(ver = vs.current)["dev"]
usethis:::use_description_field("Version",vs.new, overwrite = T)

system("git add .")
system("git commit -m update")
system("git push")


