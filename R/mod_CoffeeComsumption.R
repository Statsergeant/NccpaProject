#' CoffeeComsumption UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @import tibble shinyWidgets ggplot2 tidyverse countrycode shiny plotly



coffee_data <- read.csv(app_sys("app/www/coffee-consumption-by-country-2025.csv")) %>% as_tibble()

coffee_data$continent <- countrycode(sourcevar = coffee_data$country,
                                     origin = "country.name",
                                     destination = "continent")


mod_CoffeeComsumption_ui <- function(id) {
  ns <- NS(id)
  nav_panel(
    title = 'Coffee Consumption',
    icon = icon('mug-saucer'),
    layout_sidebar(
      sidebar = sidebar(
        width = '350',
        pickerInput(
          inputId = ns('continent'),
          label = 'Continent',
          selected = unique(coffee_data$continent),
          choices = unique(coffee_data$continent),
          multiple = T,
          options = list('actions-box' = TRUE)
        ),
        pickerInput(
          inputId = ns('country'),
          label = 'Countries',
          selected = coffee_data$country[1:5],
          choices = coffee_data$country,
          multiple = T,
          options = list(
            'max-options' = 10,
            'max-options-text' = 'No more!',
            'actions-box' = TRUE
          )
        )
      ),
      card(
        card_header(
          "World Coffee Consumption Per Capita (2022)"
          ),
        card_body (
          plotlyOutput(ns("coffeebarchart"))
          ),
        fill = T

      )



    )
  )
}

mod_CoffeeComsumption_server <- function(id){
  moduleServer(id, function(input, output, session){

    ns <- session$ns



    observeEvent(input$continent,{

      filtered_data_1 <- reactive({

        filtered_data <- coffee_data %>% filter(continent %in% input$continent)

      })

      updatePickerInput(
        session = session,
        inputId = 'country',
        choices = filtered_data_1()$country,
        selected = filtered_data_1()$country[1:5]
      )

    })



    output$coffeebarchart <- renderPlotly({

      filtered_data <- coffee_data %>% filter(country %in% input$country,
                                              continent %in% input$continent)

      max_value <- max(filtered_data$CoffeeConsumption_Consumption_tonnes_2022)

      plot <- ggplot(filtered_data,aes(x = country, y = CoffeeConsumption_Consumption_tonnes_2022, fill = country,
                                       text = paste0('Country : ', country,
                                                     '\nConsumption : ', CoffeeConsumption_Consumption_tonnes_2022))
                     ) +
        geom_bar(stat = 'identity') +
        theme_minimal() +
        scale_fill_brewer(
          palette = 'Set1'
        )  +
        theme(
          legend.position = 'none'
          # axis.text.x = element_text(angle = 90)
        ) +
        ylab('Coffee Consumption 2022') +
        scale_y_continuous(
          breaks = c(0, max_value, round(max_value/6))
        )

      ggplotly(plot, tooltip = 'text')




    })


    # output$coffeeMap <- renderPlotly({
    #   plot_ly(
    #     data = coffee_data,
    #     type = "choropleth",
    #     locations = ~flagCode,
    #     locationmode = "ISO-2",
    #     z = ~as.numeric(CoffeConsumption_ConsumptionPerCapita_KgPerCapita_2022),
    #     text = ~paste(country, "<br>Per Capita:", CoffeConsumption_ConsumptionPerCapita_KgPerCapita_2022, "kg"),
    #     colorscale = "YlOrBr",
    #     colorbar = list(title = "Kg per Capita")
    #   ) %>%
    #     layout(
    #       geo = list(
    #         showframe = FALSE,
    #         showcoastlines = FALSE,
    #         projection = list(type = "natural earth")
    #       )
    #     )
    # })
  })
}

## To be copied in the UI
# mod_CoffeeComsumption_ui("CoffeeComsumption_1")

## To be copied in the server
# mod_CoffeeComsumption_server("CoffeeComsumption_1")



