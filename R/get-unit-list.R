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

  domain |>
    request("GetUnitList", token) |>
    purrr::pluck("Units") |>
    tibblify::tibblify() |>
    identity()
}
