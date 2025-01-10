#' Get Location Data
#'
#' @seealso \url{`r aq_documentation("LocationDataServiceRequest")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#' aq_get_location_data("LC_DRY_WQ06_TEMP")
#' }
aq_get_location_data <- function(
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
    request("GetLocationData", token, query = query)
  
  spec <- tibblify::tspec_row(
    tib_chr("LocationName"),
    tib_chr("Description", required = FALSE),
    tib_chr("Identifier", required = FALSE),
    tib_chr("UniqueId"),
    tib_chr("LocationType"),
    tib_dbl("Latitude"),
    tib_dbl("Longitude"),
    tib_int("Srid", required = FALSE),
    tib_chr("ElevationUnits", required = FALSE),
    tib_dbl("Elevation", required = FALSE),
    tib_int("UtcOffset"),
  )
  
  response <- response |>
    tibblify::tibblify(spec)
  
  response
}
