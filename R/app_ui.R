#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny bslib golem
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    page_navbar(
      # theme = bs_theme(
      #   # Controls the default grayscale palette
      #   bg = "#202123", fg = "#B8BCC2",
      #   # Controls the accent (e.g., hyperlink, button, etc) colors
      #   primary = "#EA80FC", secondary = "#48DAC6",
      #   base_font = c("Grandstander", "sans-serif"),
      #   code_font = c("Courier", "monospace"),
      #   heading_font = "'Helvetica Neue', Helvetica, sans-serif",
      #   # Can also add lower-level customization
      #   "input-border-color" = "#EA80FC"
      #
      # ),

      title = 'NCCPA Interview',

      mod_homepage_ui('homepage'),
      mod_Resume_ui('Resume'),
      nav_panel(
        "Birthday",
        icon = icon("cake-candles"),
        mod_Birthday_ui("birthday")
      ),
      mod_CoffeeComsumption_ui('coffee'),
      nav_spacer(),
      nav_item(
        tags$a(
          href = "https://github.com/Statsergeant/NccpaProject",
          target = "_blank",  # opens in new tab
          fontawesome::fa("github")  # GitHub icon
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(ext = 'png'),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "NccpaProject"
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
    tags$link(rel = 'stylesheet', type = 'text/css',
              href = 'www/homepage.css'),
    tags$script(src = 'www/homepage.js')


  )
}
