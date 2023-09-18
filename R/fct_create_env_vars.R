#' create_env_vars 
#'
#' @description Define the environment variables.
#' 
#' @return The r variable.
#'
#' @noRd
fct_create_env_vars <- function(session) {
  
  # General settings ----
  
  ## Create r variable ----
  r <- new.env()
  r$rv <- shiny::reactiveValues()

  ## Golem options ----
  golem_options <- fct_get_golem_options()
  
  ## From golem_options ----
  # r$ <- golem_options$
  
  ## Get text data ----
  fct_get_texts(r = r)
  
  ### Waiter ----
  # r$rv$waiter1 <- waiter::Waiter$new(
  #   id = "waiter1Path-actionbutton",
  #   html = utils_waiter(),
  #   color = "#646464"
  # )
  
  return(r)
}
