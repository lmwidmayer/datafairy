#' @title Common metrics for numeric and factor-like data
#'
#' @description
#' Describe a numeric or factor-like vector by common metrics.
#'
#' @returns dataframe of metrics.
#'
#'
#' @param vec a numeric vector.
#' @param na.rm a logical value indicating whether NA values should be excluded.
#'
#' @details `na.rm` is FALSE by default. The total number of units will always
#' include NA.
#'
#' `describe.character` uses `describe.factor`.
#' `describe.factor` does not use `na.rm`.
#'
#' @importFrom stats median sd
#'
#' @export
describe <- function(vec, na.rm = FALSE) {
  UseMethod("describe", vec)
}

#' @export
describe.numeric <- function(vec, na.rm = FALSE) {
  res <- c(min(vec, na.rm = na.rm),
           stats::median(vec, na.rm = na.rm),
           max(vec, na.rm = na.rm),
           mean(vec, na.rm = na.rm),
           stats::sd(vec, na.rm = na.rm),
           length(vec),
           sum(is.na(vec)))
  res <- data.frame("Metric" = c("Min", "Median", "Max",
                                 "Mean", "SD",
                                 "N", "NA"),
                    "Value" = res)
  return(res)
}


#'
#' @export
describe.factor <- function(vec, na.rm = FALSE) {
  res <- table(vec, useNA = "always")
  res_names <- names(res)
  res <- data.frame("Type" = res_names,
                    "Count" = as.vector(res),
                    "Freq" = as.vector(res) / sum(as.vector(res)))
  res <- rbind(res,
               cbind("Type" = "Total",
                     "Count" = length(vec),
                     "Freq" = 1))
  return(res)
}

#'
#' @export
describe.character <- function(vec, na.rm = FALSE) {
  return(describe.factor(vec))
}
