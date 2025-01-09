#' Get Location Data
#'
#' @seealso \url{`r aq_documentation("GetTimeSeriesRawData")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_time_series_raw_data("27a6b0badd044e0c9b29d589b9e078d9")
#' }
aq_get_time_series_raw_data <- function(
    time_series_id, 
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(time_series_id)
  chk::chk_string(token)
  
  spec <- tibblify::tspec_row(
    UniqueId = tib_chr("UniqueId"),
    Parameter = tib_chr("Parameter"),
    Label = tib_chr("Label"),
    LocationIdentifier = tib_chr("LocationIdentifier"),
    Unit = tib_chr("Unit"),
    TimeRange = tibblify::tib_variant("TimeRange"),
    Points = tibblify::tib_variant("Points")
  )
  
  response <- domain |>
    aq_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append("GetTimeSeriesRawData") |>
    httr2::req_url_query(!!!list(TimeSeriesUniqueId = time_series_id)) |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    tibblify::tibblify(spec)
  
  points <- response$Points |>
    purrr::pluck(1) |>
    tibblify::tibblify()
  
  time_range <- response$TimeRange |>
    tibblify::tibblify()
  
  response |>
    dplyr::select(!c("Points", "TimeRange")) |>
    dplyr::bind_cols(time_range) |>
    dplyr::cross_join(points) |>
    identity()
 }
