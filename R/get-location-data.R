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
    LocationName = tib_chr("LocationName"),
    Description = tib_chr("Description"),
    Identifier = tib_chr("Identifier"),
    UniqueId = tib_chr("UniqueId"),
    LocationType = tib_chr("LocationType"),
    Latitude = tib_dbl("Latitude"),
    Longitude = tib_dbl("Longitude"),
    Srid = tib_int("Srid"),
    ElevationUnits = tib_chr("ElevationUnits"),
    Elevation = tib_dbl("Elevation"),
    UtcOffset = tib_int("UtcOffset")
  )
  
  response <- response |>
    tibblify::tibblify(spec)

  response
}
