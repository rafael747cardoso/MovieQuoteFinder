#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  # Create env variables ----
  r <- fct_create_env_vars(session)

  # Set gargoyles ----
  # gargoyle::init("")

  # Add modules ----
  mod_quote_finder_server(id = "quote_finder", r = r)


}
