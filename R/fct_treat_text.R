#' treat_text 
#'
#' @description Transform the text file into a data.table and save it as RDS.
#'
#' @param movie_dir
#' @param movie_name
#' @param ext
#'
#' @noRd
fct_treat_text <- function(movie_dir, movie_name, ext) {
  
  # Read the movie text file ----
  raw_text <- data.table::fread(paste0(movie_dir, "/", movie_name, ext), sep = "\n") 
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
  
  # Save it ----
  saveRDS(dt_phrases, paste0(movie_dir, "/dt_", movie_name, ".rds"))
  
}
