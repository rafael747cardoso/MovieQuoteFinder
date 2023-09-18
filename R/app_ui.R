#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  shiny::tagList(

    # External resources ----
    golem_add_external_resources(),

    # UI components ----
    bslib::page_navbar(
      id = "navbar",
      title = utils_title(),
      position = "fixed-top",
      footer = NULL,
      bg = "#333333",
      inverse = FALSE,
      theme = utils_theme(),
      window_title = golem::get_golem_options("title"),
      
      ### Quote Finder ----
      bslib::nav_panel(
        title = "Quote Finder",
        mod_quote_finder_ui(id = "quote_finder")
      )
      
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  # Add external resource paths ----
  golem::add_resource_path("www", app_sys("app/www"))
  
  # Head ----
  shiny::tags$head(
    ## Add waiter dependencies ----
    waiter::useWaiter(),
    
    ## Activate use of shinyjs:: functions ----
    shinyjs::useShinyjs(),
    
    ## Add icon for browser tab ----
    golem::favicon(ico = "favicon", ext = "ico"),
    
    ## Define HTML dependencies ----
    golem::bundle_resources(
      path = app_sys("app/www"),
      app_title = golem::get_golem_options("title")
    )
  )
}
