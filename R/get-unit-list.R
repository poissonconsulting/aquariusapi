#' Get Unit List
#'
#' @seealso \url{`r aq_documentation("UnitListServiceRequest")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#' aq_get_unit_list()
#' }
aq_get_unit_list <- function(
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)

  response <- domain |>
    request("GetUnitList", token)
  
  response <- response |>
    purrr::pluck("Units") |>
    tibblify::tibblify() |>
    identity()
  
  response
}
