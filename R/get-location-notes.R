#' Get Location Notes
#'
#' @seealso \url{`r aq_documentation("LocationNotesServiceRequest")`}
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
    location_identifier,
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(location_identifier)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)

  query <- list(LocationIdentifier = location_identifier)

  response <- domain |>
    request("GetLocationNotes", token, query = query)
  
  spec <- tibblify::tspec_row(
    tib_chr("LocationName"),
    tib_chr("LocationIdentifier"),
    tib_chr("LocationUniqueId"),
    tib_variant("LocationNotes")
  )

  response <- response |>
    tibblify::tibblify(spec)
  
  spec_location_notes <- tibblify::tspec_df(
    tib_chr("UniqueID", required = FALSE),
    tib_chr("CreateTimeUtc", required = FALSE),
    tib_chr("LastModifiedUtc", required = FALSE),
    tib_chr("FromTimeUtc", required = FALSE),
    tib_chr("ToTimeUtc", required = FALSE),
    tib_chr("Details", required = FALSE),
    tib_chr("TimeSeriesUniqueId", required = FALSE),
    tib_chr("LastModifiedByUser", required = FALSE),
    tib_chr("CreatedByUser", required = FALSE)
  )
  
  location_notes <- response$LocationNotes |>
    tibblify::tibblify(spec_location_notes)
  
  response <- response |>
    dplyr::select(!"LocationNotes") |>
    dplyr::cross_join(location_notes) |>
    identity()
  
  response
}
