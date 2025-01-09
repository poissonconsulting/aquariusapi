#' Get Location Notes
#'
#' @seealso \url{`r aq_documentation("GetLocationNotes")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#' aq_get_location_notes("LC_DRY_WQ06_TEMP")
#' }
aq_get_location_notes <- function(
    location_id,
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(location_id)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)

  query <- list(LocationIdentifier = location_id)

  response <- domain |>
    request("GetLocationNotes", token, query = query)
  
  spec <- tibblify::tspec_row(
    tib_chr("LocationName"),
    tib_chr("LocationIdentifier"),
    tib_chr("LocationUniqueId")
  )
  
  response <- response |>
    tibblify::tibblify(spec) 

  response
}
