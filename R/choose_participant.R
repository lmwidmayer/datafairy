#' @title Select participant by id
#'
#' @param id Participant identifier.
#'
#' @description
#' Select participant dataset (list) from participant list.
#'
#' @export
choose_participant <- function(id) {
  return(datafairy::p_lst[[id]])
}
