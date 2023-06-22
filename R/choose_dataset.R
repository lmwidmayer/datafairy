#' @title Choose dataset by name
#'
#' @param name Name of dataset.
#'
#' @export
choose_dataset <- function(name = NULL) {
  switch(name,
    "trtctrl_df" = return(datafairy::trtctrl_df)
  )
}
