#' treat_text 
#'
#' @description Transform the text object.
#'
#' @param movie_path
#'
#' @return The text object as a data.table where each row is a phrase.
#'
#' @noRd
fct_treat_text <- function(movie_path) {
  
  raw_text <- data.table::fread(movie_path, sep = "\n") 
  names(raw_text) = "phrases"
  
  text_lines <- paste(raw_text$phrases, collapse = " ")
  
  # Ideally it should separate by (. ! ?)
  phrases <- unlist(strsplit(text_lines, "\\."))
  
  dt_phrases <- data.table::data.table(Phrase = phrases)
  
  dt_phrases$n <- 1:nrow(dt_phrases)
  dt_phrases <- dt_phrases[, c(2, 1)]
  
  return(dt_phrases)
}
