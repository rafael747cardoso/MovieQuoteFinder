#' get_golem_options
#' 
#' @description Get the list of input variables.
#' 
#' @param quiet
#' 
#' @return The golem options.
#' 
#' @noRd
fct_get_golem_options <- function() {
  
  options <- golem::get_golem_options()
  
  # Log input variables
  purrr::walk2(
    .x = names(options),
    .y = options,
    .f = ~ {
      ### If .y is a long vector, only show the length of .y
      if (length(.y) > 1) {
        .y = paste(length(.y), "arguments passed")
      }
    }
  )
  
  return(options)
}
