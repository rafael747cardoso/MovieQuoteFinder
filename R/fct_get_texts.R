#' get_texts 
#'
#' @description Read the text files into the r variable.
#'
#'  @param r r
#'
#' @noRd
fct_get_texts <- function(r) {
  
  # Paths ----
  movie_dir = "Quotes Movies"
  
  # Convert from txt to data.table rds files (takes awfully long for big texts)
  convert <- FALSE
  if (convert) {
    fct_treat_text(movie_dir = movie_dir, ext = ".txt", movie_name = "The_Lord_of_the_Rings")
    fct_treat_text(movie_dir = movie_dir, ext = ".txt", movie_name = "Harry_Potter")
    fct_treat_text(movie_dir = movie_dir, ext = ".txt", movie_name = "Jurassic_Park")
    fct_treat_text(movie_dir = movie_dir, ext = ".txt", movie_name = "Star_Wars")
    fct_treat_text(movie_dir = movie_dir, ext = ".txt", movie_name = "The_Matrix")
  }
  
  # Read the movies quotes ----
  r$rv$dt_lr <- readRDS(paste0(movie_dir, "/dt_The_Lord_of_the_Rings.rds"))
  r$rv$dt_hp <- readRDS(paste0(movie_dir, "/dt_Harry_Potter.rds"))
  r$rv$dt_jp <- readRDS(paste0(movie_dir, "/dt_Jurassic_Park.rds"))
  r$rv$dt_sw <- readRDS(paste0(movie_dir, "/dt_Star_Wars.rds"))
  r$rv$dt_tm <- readRDS(paste0(movie_dir, "/dt_The_Matrix.rds"))
  
}
