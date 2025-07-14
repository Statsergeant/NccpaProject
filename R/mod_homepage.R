#' homepage UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_homepage_ui <- function(id) {
  ns <- NS(id)
    nav_panel(
      title = 'Homepage',
      icon = icon('home'),
      HTML('
           <div id="background-container">
              <img id="rotating-bg" src="" alt="rotating background" />
              <div class="gradient-overlay"></div>
              <div id="text-overlay">
                <h1 id="home_title">NCCPA Interview</h1>
                <h3 id="home_secondtitle">Geo Jeong</h3>
              </div>
            </div>
           ')
      # includeScript('www/homepage.js')
    )
}

#' homepage Server Functions
#'
#' @noRd
mod_homepage_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_homepage_ui("homepage_1")

## To be copied in the server
# mod_homepage_server("homepage_1")
