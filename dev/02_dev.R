
# Set up ----

## restart R session ----

## Update r profile ----
usethis::edit_r_profile(scope = "project")

## Update .Rprofile ----
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org/"
  options(repos = r)
})

## Install renv ----
if (!"renv" %in% installed.packages()) {
  install.packages("renv", type = "source")
  renv::init(bare = TRUE, restart = TRUE)
}

## Install dependencies ----
pkgs_cran <- c(
  ### CRAN packages ----
  "devtools"
  , "data.table"
  , "magrittr"
  , "glue"
  , "purrr"
  , "attachment"
  , "DT"
  , "shiny"
  , "shinyjs"
  , "shinyWidgets"
  , "shinydashboard"
  , "bslib"
  , "bsicons"
  , "htmltools"
  , "htmlwidgets"
  , "golem"
  , "config"
  , "pkgload"
  , "gargoyle"
  , "waiter"
)
install.packages(pkgs_cran)

## Amend DESCRIPTION ----
purrr::walk(
  .x = pkgs_cran,
  .f = usethis::use_package
)

## Build the package ----
# ctrl+shift+b

## Take snapshot ----
renv::snapshot(prompt = FALSE)
renv::status()

# Engineering ----

## Dependencies ----
## Amend DESCRIPTION with dependencies read from package code parsing
## install.packages('attachment') # if needed.
attachment::att_amend_desc()

## Add modules ----
## Create a module infrastructure in R/
golem::add_module(name = "", with_test = TRUE) # Name of the module

## Add helper functions ----
## Creates fct_* and utils_*
golem::add_fct("filter_terms", with_test = TRUE)
golem::add_utils("golem_ui", with_test = TRUE)

## External resources
## Creates .js and .css files at inst/app/www
# golem::add_js_file("script")
# golem::add_js_handler("handlers")
# golem::add_css_file("custom")
# golem::add_sass_file("custom")

## Add internal datasets ----
## If you have data in your package
# usethis::use_data_raw(name = "my_dataset", open = FALSE)

## Tests ----
## Add one line by test you want to create
# usethis::use_test("app")

# Documentation

# ## Vignette ----
# usethis::use_vignette("MovieQuoteFinder")
# devtools::build_vignettes()
#
# ## Code Coverage----
# ## Set the code coverage service ("codecov" or "coveralls")
# usethis::use_coverage()
#
# # Create a summary readme for the testthat subdirectory
# covrpage::covrpage()
#
# ## CI ----
# ## Use this part of the script if you need to set up a CI
# ## service for your application
# ##
# ## (You'll need GitHub there)
# usethis::use_github()
#
# # GitHub Actions
# usethis::use_github_action()
# # Chose one of the three
# # See https://usethis.r-lib.org/reference/use_github_action.html
# usethis::use_github_action_check_release()
# usethis::use_github_action_check_standard()
# usethis::use_github_action_check_full()
# # Add action for PR
# usethis::use_github_action_pr_commands()
#
# # Travis CI
# usethis::use_travis()
# usethis::use_travis_badge()
#
# # AppVeyor
# usethis::use_appveyor()
# usethis::use_appveyor_badge()
#
# # Circle CI
# usethis::use_circleci()
# usethis::use_circleci_badge()
#
# # Jenkins
# usethis::use_jenkins()
#
# # GitLab CI
# usethis::use_gitlab_ci()
#
# # You're now set! ----
# # go to dev/03_deploy.R
# rstudioapi::navigateToFile("dev/03_deploy.R")
