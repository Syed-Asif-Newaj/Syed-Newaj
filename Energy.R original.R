library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("Exponential Function Graph of Energy Diagram"),
  sidebarLayout(
    sidebarPanel(
      numericInput("A", "Amplitude (A)", value = 1),
      numericInput("B", "Base (B)", value = 2),
      numericInput("C", "Coefficient (C)", value = 0),
      numericInput("D", "Exponent (D)", value = 1)
    ),
    mainPanel(
      plotOutput("energy_plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$energy_plot <- renderPlot({
    x <- seq(0, 10, by = 0.1)
    y <- input$A * input$B^(input$C + input$D * x)
    
    ggplot(data = data.frame(x = x, y = y), aes(x = x, y = y)) +
      geom_line() +
      labs(title = "Exponential Function Graph",
           x = "Energy",
           y = "Amplitude") +
      theme_minimal()
  })
}

# Run the application
shinyApp(ui = ui, server = server)