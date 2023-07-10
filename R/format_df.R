#' @title Format numeric values for printing data frames
#'
#' @description
#' Format numeric values by converting them to character.
#'
#' @param df data.frame
#' @param digits to how many decimals should numeric data be rounded?
#' @param tryInt check if numeric data are integer like and do not round if so
#' @param align_right total number of characters to be used for numeric data, use this for nice alignment, NOT IMPLEMENTED
#'
#' @importFrom stats na.omit
#'
#' @returns Formatted data.frame.
#'
#' @export
format_df <- function(df, digits = 2, tryInt = TRUE, align_right = FALSE) {
  str_expr <- paste0("%.", digits, "f")
  df <- lapply(df, function(vec) {
    if (is.numeric(vec)) {
      if (tryInt && (is.integer(vec) || all(stats::na.omit(vec %% 1 == 0)))) {
        as.integer(vec)
      } else {
        sprintf(str_expr, round(vec, digits))
      }
    } else {
      vec
    }
  })
  return(data.frame(df))
}
