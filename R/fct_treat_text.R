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
  
  # Read the movie text file ----
  raw_text <- data.table::fread(movie_path, sep = "\n") 
  names(raw_text) = "phrases"
  
  # Collapse all rows to one single string ----
  text_string <- paste(raw_text$phrases, collapse = " ")
  
  # Split the phrases ----
  phrases <- unlist(strsplit(x = text_string, 
                             split = "(?<=[.!?])\\s+",
                             perl = TRUE))

  
  
  
  
  # Make a data.table with all the phrases ----
  dt_phrases <- data.table::data.table(Phrase = phrases)
  dt_phrases$n <- 1:nrow(dt_phrases)
  dt_phrases <- dt_phrases[, c(2, 1)]
  
  return(dt_phrases)
}
