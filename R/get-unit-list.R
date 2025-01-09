#' Get Unit List
#' 
#' \url{https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2/json/metadata?op=UnitListServiceRequest}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_unit_list()
#' }
aq_get_unit_list <- function(
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(token)
  chk::chk_string(domain)
  
  domain |>
    base_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append("GetUnitList") |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    purrr::pluck("Units") |>
    tibblify::tibblify() |>
    identity()
}
