source("ui/fileInput.R", local = TRUE)

tabPanel(
  tags$head(tags$link(rel = "shortcut icon", href = "favicon.png")),
  title = "CWL Exploder",

  # use shinydashboard components
  includeCSS("www/AdminLTE.css"),
  includeCSS("www/shinydashboard.css"),

  # customize bootstrap and fileInput button
  includeCSS("www/custom.css"),
  includeCSS("www/btn-dnd.css"),

  shinydashboard::box(
    width = 12,
    title = "CWL Exploder", status = "primary", solidHeader = TRUE,

    fluidRow(
      column(
        width = 6, offset = 3,
        fileInput1("cwl", label = "", buttonLabel = "")
      ),
      column(
        width = 6, offset = 3,
        uiOutput("ui_download")
      )
    )
  ),

  fluidRow(
    column(
      width = 12
    )
  ),

  fluidRow(
    HTML('<p align="center">&copy; 2020 <a href="https://www.cancergenomicscloud.org/" target="_blank">Cancer Genomics Cloud</a> by <a href="https://www.sevenbridges.com/" target="_blank">Seven Bridges</a></p>'),
    HTML('<p align="center">Licensed under the GNU Affero GPL v3</p>')
  ),

  tags$script(HTML("var header = $('.navbar > .container-fluid'); header.append('<div style=\"float:right;margin:15px;\"><a href=\"https://github.com/nanxstats/cwl-exploder\" target=\"_blank\" style=\"color:white\">Source Code</a>&nbsp;&nbsp;<font color=\"white\">|</font>&nbsp;&nbsp;<a href=\"https://github.com/rabix/cwl-format\" target=\"_blank\" style=\"color:white\">Python Package</a>&nbsp;&nbsp;<font color=\"white\">|</font>&nbsp;&nbsp;<a href=\"atac-seq-pipeline.json\" target=\"_blank\" style=\"color:white\">Monolithic CWL Example</a>&nbsp; </div>'); console.log(header)"))
)
