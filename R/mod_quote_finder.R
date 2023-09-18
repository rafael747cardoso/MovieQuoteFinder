#' quote_finder UI Function
#'
#' @description The main module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
mod_quote_finder_ui <- function(id){
  ns <- shiny::NS(id)
  shiny::tagList(
    htmltools::tags$div(
      class = "main-nav",
      shiny::fluidRow(
        col_12(
          shiny::fluidRow(
            # Movie ----
            col_4(
              shiny::selectInput(
                inputId = ns("selected_movie"),
                label = "Movie",
                width = "100%",
                choices = golem::get_golem_options("opts_movies"),
                selected = golem::get_golem_options("opts_movies")[1]
              )
            ),
            # Terms ----
            col_5(
              shiny::textInput(
                inputId = ns("selected_terms"),
                label = "Terms ( ; separated )",
                width = "100%"
              )
            ),
            # Search button ----
            col_3(
              shiny::actionButton(
                inputId = ns("search_btn"),
                label = "Search",
                width = "100%"
              )
            )
          ),
          shiny::fluidRow(
            # Filtered quotes ----
            DT::dataTableOutput(outputId = ns("terms_tbl"))
          )
        )
      )
    )
  )
}

#' quote_finder Server Functions
#'
#' @param id
#' @param r
#'
#' @noRd 
mod_quote_finder_server <- function(id, r){
  shiny::moduleServer(id, function(input, output, session){
    ns <- session$ns
    
    # Show the results of the search ----
    shiny::observeEvent(input$search_btn, {
      
      ## Select the data.table for the selected movie ----
      movie <- input$selected_movie
      dt <- switch (movie,
        "The Lord of the Rings" = r$rv$dt_lr,
        "Harry Potter"          = r$rv$dt_hp,
        "Jurassic Park"         = r$rv$dt_jp,
        "Star Wars"             = r$rv$dt_sw,
        "The Matrix"            = r$rv$dt_tm
      )
      
      ## Filter the phrases for the inputted terms ----
      dt_filtered <- fct_filter_terms(dt = dt,
                                      terms = input$selected_terms)

      ## Display the results ----
      output$terms_tbl <- DT::renderDT(
        dt_filtered,
        options = list(
          dom = "t",
          paging = FALSE,
          searching = FALSE,
          lengthChange = FALSE
        ),
        rownames = FALSE
      )

    }, ignoreInit = TRUE)

  })
}
