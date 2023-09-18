#' filter_terms 
#'
#' @description Filter by the inputted terms.
#'
#' @param dt
#' @param terms
#'
#' @return The filtered data.table.
#'
#' @noRd
fct_filter_terms <- function(dt, terms) {
  
  # Fix some possible terms ----
  terms <- gsub(pattern = "\\?",
                replacement = "\\\\?",
                x = terms)

  # Split the terms ----
  terms <- strsplit(x = terms, split = ";")[[1]]
  
  # Search in the phrases ----
  dt_f <- dt[sapply(X = terms,
                    FUN = function(phrase) grepl(paste(terms, collapse = ".*"),
                                                 dt$Phrase)
                    ), ]
  
  return(dt_f)
}
