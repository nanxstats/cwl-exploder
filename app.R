library("shiny")
library("shinydashboard")
library("htmltools") # remotes::install_github("rstudio/htmltools@984b39c")

ui <- uiOutput("ui")

server <- function(input, output, session) {
  output$ui <- renderUI({
    source(file.path("ui", "header.R"), local = TRUE)$value
  })

  source(file.path("server", "server.R"), local = TRUE)$value
}

shinyApp(ui, server)
