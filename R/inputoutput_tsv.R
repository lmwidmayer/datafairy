#' @title Tab-stop separated data output
#'
#' @description
#' Wrapper for write.table() to write tab-stop separated text file (tsv).
#'
#' @returns Write tsv file.
#'
#' @param x object to be written, matrix or data frame.
#' @param ... argument to `write.table`: `sep` cannot be altered.
#'
#' @importFrom utils write.table
#'
#' @export
write_tsv <- function(x, ...){
  arg_list <- list(...)
  if (!is.null(arg_list[["sep"]])) {
    stop("Cannot set `sep` in write_tsv.")
  }
  utils::write.table(x, sep = "\t", ...)
}
