#' @title Minimal codebook from data.frame
#'
#' @param df data.frame.
#' @param auto.type logical. Should the column's data type be filled in
#' automatically?
#' @param content.type logical. Should there be an extra row to describe what
#' this codebook contains?
#'
#' @description Create a minimal codebook df from an input df. For each column
#' of the input df, one row will be created. Save the codebook df as a text
#' file in the format of your choice (e.g. csv or json) and fill it out.
#' There will be columns for the variable/ measurement name, the data type, the
#' unit of measurement, a description and an annotation.
#'
#' @return Returns a data.frame with one row per column of the original
#' data.frame.
#'
#' @usage mini_cb(df, auto.type = TRUE, content.type = FALSE)
#'
#' @examples
#' # example code
#' df <- data.frame(
#'   id = 1:4,
#'   condition = factor(LETTERS[1:4]),
#'   score = c(2.1, 4.0, NA, 3.3)
#' )
#' cb <- mini_cb(df, auto.type = TRUE, content.type = TRUE)
#' cb
#' # write(jsonlite::toJSON(cb, pretty = TRUE), "cb_path.json")
#'
#' @export
mini_cb <- function(df, auto.type = TRUE, content.type = FALSE) {
  cb <- data.frame(
    NAME = colnames(df),
    TYPE = "",
    UNIT = "",
    DESCRIPTION = "",
    ANNOTATION = ""
  )
  if (auto.type) {
    cb$TYPE <- unlist(lapply(df, class))
  }
  if (content.type) {
    cb_content <- data.frame(
      NAME = "CONTENT",
      TYPE = "CODEBOOK",
      UNIT = "",
      DESCRIPTION = "",
      ANNOTATION = ""
    )
    cb <- rbind(cb_content, cb)
  }
  return(cb)
}
