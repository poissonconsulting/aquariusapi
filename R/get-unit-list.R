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
  
  spec_units <- tibblify::tspec_df(
    tib_chr("UniqueId"),
    tib_chr("Identifier"),
    tib_chr("GroupIdentifier"),
    tib_chr("Symbol"),
    tib_chr("DisplayName"),
    tib_chr("BaseMultiplier"),
    tib_chr("BaseOffset"),
  )
  
  response <- response |>
    purrr::pluck("Units") |>
    tibblify::tibblify(spec_units) |>
    identity()
  
  response
}
