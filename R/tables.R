#' Get Tables for Aquarius Database
#'
#' @inheritParams params
#'
#' @return A tibble with xx
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_tables()
#' }
aq_tables <- function(token = aq_token()) {
  chk::chk_string(token)
  
  response <- base_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append(session_append = "GetLocationData") |>
    httr2::req_url_query(!!!list(LocationIdentifier = "LC_DRY_WQ06_TEMP")) |>
    httr2::req_headers(Authorization = paste("Bearer", token)) |>
    httr2::req_user_agent("aquariusapi") |>
    httr2::req_perform(verbosity = 0) |>
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
