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
#'  aq_get_location_data("LC_DRY_WQ06_TEMP")
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
  
  spec <- tibblify::tspec_row(
    Identifier = tib_chr("Identifier"),
    LocationName = tib_chr("LocationName"),
    LocationType = tib_chr("LocationType"),
    Latitude = tib_dbl("Latitude"),
    Longitude = tib_dbl("Longitude"),
    UtcOffset = tib_int("UtcOffset"),
    Elevation = tib_dbl("Elevation"),
    ElevationUnits = tib_chr("ElevationUnits"),
    Description = tib_chr("Description"),
    Srid = tib_int("Srid"),
    UniqueId = tib_chr("UniqueId"),
    ExtendedAttributes = tibblify::tib_variant("ExtendedAttributes"),
    LocationDatum = tibblify::tib_variant("LocationDatum"),
    Tags = tibblify::tib_variant("Tags")
  )
  
  query <- list(LocationIdentifier = location_id)
  
  response <- domain |>
    request("GetLocationData", token, query = query) |>
    tibblify::tibblify(spec) |>
    identity()
}
