#' Birthday UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Birthday_ui <- function(id) {
  ns <- NS(id)

  layout_sidebar(

    sidebar = sidebar(
      width = 350,
      sliderInput(
      inputId = ns("class_size"),
      label = "🎂 Class Size (Number of People):",
      min = 1,
      max = 100,
      value = 5,
      step = 1,
      ticks = FALSE,
      animate = animationOptions(interval = 1000, loop = TRUE)
    )
    ),

    tags$h3("Probability of Everyone Having Different Birthdays"),
    div(
      textOutput(ns("probability")),
      style = 'text-align: center;'
    )
    ,
    withMathJax(uiOutput(ns("dynamic_eq"))),
    br(), br(),
    plotOutput(ns("probPlot"))
  )
}


#' Birthday Server Functions
#'
#' @noRd
mod_Birthday_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns

    # Function to calculate the probability and generate the equation
    different_birthday_probability <- function(class_size) {
      if (class_size > 365) {
        return(list(prob = 0, equation = "0")) # Impossible for >365 people
      }
      prob <- 1
      equation <- "1"
      for (i in 1:(class_size - 1)) {
        prob <- prob * (365 - i) / 365
        equation <- paste0(equation, " \\cdot \\frac{", 365 - i, "}{365}")
      }
      return(list(prob = prob, equation = equation))
    }

    # Display probability as text
    output$probability <- renderText({
      prob <- different_birthday_probability(input$class_size)$prob
      paste0("With ", input$class_size, " people, the probability is: ",
             round(prob * 100, 2), "%")
    })

    # Render the dynamic LaTeX equation
    output$dynamic_eq <- renderUI({
      n <- input$class_size
      result <- different_birthday_probability(n)

      # MathJax LaTeX rendering
      tags$div(
        HTML(paste0("$$P(\\text{All Different Birthdays}) = ", result$equation, "$$")),
        tags$script("MathJax.Hub.Queue(['Typeset', MathJax.Hub]);") # Force MathJax re-render
      )
    })

    # Plot the probability curve and show the equation
    output$probPlot <- renderPlot({
      sizes <- 1:100
      probs <- sapply(sizes, function(n) different_birthday_probability(n)$prob)

      # Plot the probability curve
      plot(sizes, probs, type = "l", col = "blue", lwd = 2,
           xlab = "Number of People in the Class",
           ylab = "Probability of All Different Birthdays",
           main = "Probability of All Different Birthdays")

      # Add vertical line for the selected class size
      abline(v = input$class_size, col = "red", lwd = 2, lty = 2)
      points(input$class_size, different_birthday_probability(input$class_size)$prob,
             col = "red", pch = 19)

      # Add legend
      legend("topright", legend = c("Probability Curve", "Selected Class Size"),
             col = c("blue", "red"), lwd = 2, lty = c(1, 2), pch = c(NA, 19))


  })

  })
}

## To be copied in the UI
# mod_Birthday_ui("Birthday_1")

## To be copied in the server
# mod_Birthday_server("Birthday_1")
