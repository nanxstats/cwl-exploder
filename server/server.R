source("server/wrapper.R", local = TRUE)

random_id <- function() paste(sample(c(letters, 0:9), 16, replace = TRUE), collapse = "")

react_explode_cwl <- reactive({
  input_cwl <- input$cwl
  rndpath <- paste0(tempdir(), "/", random_id())
  dir.create(rndpath)
  inname <- tools::file_path_sans_ext(input_cwl$name)
  outname <- paste0(inname, ".cwl")
  outpath <- paste0(rndpath, "/", outname)
  explode_cwl(input_cwl$datapath, outpath)
  rndpath
})

output$btn_download <- downloadHandler(
  filename = function() {
    pb <- Sys.time()
    attributes(pb)$tzone <- "America/New_York" # convert to EST
    paste("cwl-", gsub(" ", "-", gsub(":", "-", pb)), ".zip", sep = "")
  },
  content = function(file) {
    tmp <- tempfile(fileext = ".zip")
    rndpath <- react_explode_cwl()
    owd <- setwd(rndpath)
    on.exit(setwd(owd))
    utils::zip(tmp, ".", extras = "-qq")
    unlink(rndpath, recursive = TRUE)
    file.rename(tmp, file)
  }
)

output$ui_download <- renderUI({
  req(input$cwl$datapath)
  downloadButton(
    "btn_download",
    label = "Explode & Download",
    class = "btn btn-sm btn-block"
  )
})
