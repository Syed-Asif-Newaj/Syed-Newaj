library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
  titlePanel("Exponential Function Graph of Energy Diagram"),
  sidebarLayout(
    sidebarPanel(
      numericInput("B", "Base (B)", value = 2),
      numericInput("A", "Amplitude", value = 1),
      numericInput("C", "Coefficient (C)", value = -2),
      numericInput("D", "Exponent (D)", value = -3)
    ),
    mainPanel(
      plotOutput("energy_plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$energy_plot <- renderPlot({
    x <- seq(0, 5, by = 1)
    y <- input$A * input$B^(input$C + input$D * x)
    
    ggplot(data = data.frame(y = y, x = x), aes(x = x, y = y)) + 
      
      geom_line() + 
      
      labs(title = "Exponential Function Graph", 
           
           x = "Amplitude", 
           
           y = "Energy") + 
      
      theme_minimal() 
    
  }) 
}

# Run the application
shinyApp(ui = ui, server = server)