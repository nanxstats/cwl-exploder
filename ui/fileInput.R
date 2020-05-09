fileInput1 <- function(inputId, label, multiple = FALSE, accept = NULL, width = NULL, buttonLabel = "Browse...", placeholder = "No file selected") {
  restoredValue <- restoreInput(id = inputId, default = NULL)
  if (!is.null(restoredValue) && !is.data.frame(restoredValue)) {
    warning("Restored value for ", inputId, " has incorrect format.")
    restoredValue <- NULL
  }
  if (!is.null(restoredValue)) {
    restoredValue <- toJSON(restoredValue, strict_atomic = FALSE)
  }
  inputTag <- tags$input(
    id = inputId, name = inputId, type = "file",
    style = "display: none;", `data-restore` = restoredValue
  )
  if (multiple) {
    inputTag$attribs$multiple <- "multiple"
  }
  if (length(accept) > 0) {
    inputTag$attribs$accept <- paste(accept, collapse = ",")
  }
  div(
    class = "form-group shiny-input-container",
    style = if (!is.null(width)) {
      paste0("width: ", validateCssUnit(width), ";")
    },
    shiny:::shinyInputLabel(
      inputId,
      label
    ),
    div(
      class = "input-group",
      tags$label(
        class = "input-group-btn",
        span(
          class = "btn btn-block btn-dnd", buttonLabel, inputTag,
          br(), br(),
          tags$image(src = "arrow-alt-circle-down-regular.svg", width = "100px"),
          div(p("Drop your workflow (.cwl or .json) here!"), style = "font-size: 2.5rem; font-weight: 700; padding-top: 2rem; padding-bottom: 0.5rem;"),
          div(p("One workflow at a time, max 20 MB."), style = "font-size: 1.5rem; font-weight: 500;"),
          br()
        )
      )
    ),
    br(),
    tags$div(
      id = paste(inputId, "_progress", sep = ""),
      class = "progress progress-striped active shiny-file-input-progress",
      tags$div(class = "progress-bar")
    )
  )
}
