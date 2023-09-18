#' utils_title
#' @description Define the navbar title
#' @return Navbar title.
#' @noRd
utils_title <- function() {

  shiny::tagList(

    ## Logo
    htmltools::tags$span(
      class = "dashboard-logo",
      htmltools::tags$img(
        src = "inst/app/www/logo.png",
        height = "39px"
      )
    ),

    ## Title
    htmltools::tags$span(
      class = "dashboard-title",
      golem::get_golem_options("title")
    )
  )
}
