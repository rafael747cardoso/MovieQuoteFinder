#' get_texts 
#'
#' @description Read the text files into the r variable.
#'
#'  @param r r
#'
#' @noRd
fct_get_texts <- function(r) {
  
  # Read the movies quotes ----
  r$rv$dt_lr <- fct_treat_text(movie_path = "Quotes Movies/The Lord of the Rigns.txt")
  r$rv$dt_hp <- fct_treat_text(movie_path = "Quotes Movies/Harry Potter.txt")
  r$rv$dt_jp <- fct_treat_text(movie_path = "Quotes Movies/Jurassic Park.txt")
  r$rv$dt_sw <- fct_treat_text(movie_path = "Quotes Movies/Star Wars.txt")
  r$rv$dt_tm <- fct_treat_text(movie_path = "Quotes Movies/The Matrix.txt")

}
