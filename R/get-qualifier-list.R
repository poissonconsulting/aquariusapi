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
#' aq_get_qualifier_list()
#' }
aq_get_qualifier_list <- function(
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)

  response <- domain |>
    request("GetQualifierList", token) 
  
  spec <- tibblify::tspec_df(
    tib_chr("Identifier"),
    tib_chr("Code"),
    tib_chr("DisplayName")
  )
  
  response <- response |>
    purrr::pluck("Qualifiers") |>
    tibblify::tibblify(spec)

  response
}
