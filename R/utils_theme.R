#' utils_theme
#' @description Define the navbar theme.
#' @param main_bg main_bg
#' @param primary primary
#' @param secondary secondary
#' @param success success
#' @param info info
#' @param warning warning
#' @param danger danger
#' @param light light
#' @param dark dark
#' @param theme theme
#' @return The theme.
#' @noRd
utils_theme <- function() {
  
  bslib::bs_theme(
    version = 5,
    bootswatch = NULL,
    bg = "#452C68",
    fg = "#FFDD40",
    primary = "#1C3555",
    secondary = NULL,
    success = "#2F5D98",
    info = "#888B8E",
    warning = NULL,
    danger = "#D93323",
    base_font = bslib::font_google("Karla"),
    code_font = bslib::font_google("Karla"),
    heading_font = bslib::font_google("Karla"),
    font_scale = 0.9,
    "bs-navbar-padding-y" = "0rem"
  )
  
}
