#' Get Tables for Aquarius Database
#' 
#' 
#' \url{https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2/json/metadata?op=ParameterListServiceRequest}
#'
#' @inheritParams params
#'
#' @return A tibble with xx
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_parameter_list()
#' }
aq_get_parameter_list <- function(token = aq_token()) {
  chk::chk_string(token)
  
  base_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append("GetParameterList") |>
    httr2::req_headers(Authorization = paste("Bearer", token)) |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    purrr::pluck("Parameters") |>
    tibblify::tibblify()
}
