library("reticulate")

source_python("server/cwl-exploder.py")

#' @examples
#' explode_cwl("www/atac-seq-pipeline.json", "www/atac-seq.cwl")
explode_cwl <- function(input, output) {
  explode_cwl_py(input, output)
  invisible()
}
