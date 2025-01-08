#' Get Tables for Aquarius Database
#'
#' @inheritParams params
#'
#' @return A tibble with xx
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_location_data("LC_DRY_WQ06_TEMP")
#' }
aq_get_location_data <- function(location, token = aq_token()) {
  chk::chk_string(location)
  chk::chk_string(token)
  
  spec <- tibblify::tspec_row(
    UniqueId = tib_chr("UniqueId"),
    LocationType = tib_chr("LocationType"),
    Latitude = tib_dbl("Latitude"),
    Longitude = tib_dbl("Longitude"),
    UtcOffset = tib_int("UtcOffset"),
    Elevation = tib_dbl("Elevation"),
    ElevationUnits = tib_chr("ElevationUnits"),
    Description = tib_chr("Description")
  )

 base_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append("GetLocationData") |>
    httr2::req_url_query(!!!list(LocationIdentifier = location)) |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    tibblify::tibblify(spec)
}
