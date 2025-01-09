#' Get Parameter List
#' 
#' @seealso \url{`r aq_documentation("QualifierListServiceRequest")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_qualifier_list()
#' }
aq_get_qualifier_list <- function(
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  domain |>
    request("GetQualifierList", token) |>
    purrr::pluck("Qualifiers") |>
    tibblify::tibblify()
}
