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
  
  response <- base_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append("GetLocationData") |>
    httr2::req_url_query(!!!list(LocationIdentifier = location)) |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json()
  
  dplyr::tibble(
    location_unique_id = response$UniqueId,
    location_type = response$LocationType,
    latitude = response$Latitude,
    longitude = response$Longitude,
    utc_offset = response$UtcOffset,
    elevation = response$Elevation,
    elevation_units = response$ElevationUnits,
    location_description = response$Description
  ) 
}
