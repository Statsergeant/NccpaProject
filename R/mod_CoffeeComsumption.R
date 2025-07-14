#' CoffeeComsumption UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom plotly plotlyOutput renderPlotly
#' @import plotly
coffee_data <- read.csv(app_sys("app/coffee-consumption-by-country-2025.csv"))


mod_CoffeeComsumption_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    title = 'Coffee Consumption',
    layout_sidebar(
      sidebar = sidebar(),
      main = tagList(
        h2("World Coffee Consumption Per Capita (2022)")
        # plotlyOutput(ns("coffeeMap"))
      )
    )
  )
}

mod_CoffeeComsumption_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$coffeeMap <- renderPlotly({
      plot_ly(
        data = coffee_data_clean,
        type = "choropleth",
        locations = ~flagCode,
        locationmode = "ISO-2",
        z = ~as.numeric(CoffeConsumption_ConsumptionPerCapita_KgPerCapita_2022),
        text = ~paste(country, "<br>Per Capita:", CoffeConsumption_ConsumptionPerCapita_KgPerCapita_2022, "kg"),
        colorscale = "YlOrBr",
        colorbar = list(title = "Kg per Capita")
      ) %>%
        layout(
          geo = list(
            showframe = FALSE,
            showcoastlines = FALSE,
            projection = list(type = "natural earth")
          )
        )
    })
  })
}

## To be copied in the UI
# mod_CoffeeComsumption_ui("CoffeeComsumption_1")

## To be copied in the server
# mod_CoffeeComsumption_server("CoffeeComsumption_1")



