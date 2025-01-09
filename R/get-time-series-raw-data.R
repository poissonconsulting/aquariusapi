#' Get Location Data
#'
#' @seealso \url{`r aq_documentation("TimeSeriesDataRawServiceRequest")`}
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
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(time_series_id)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  spec <- tibblify::tspec_row(
    UniqueId = tib_chr("UniqueId"),
    Parameter = tib_chr("Parameter"),
    Label = tib_chr("Label"),
    LocationIdentifier = tib_chr("LocationIdentifier"),
    Unit = tib_chr("Unit"),
    TimeRange = tibblify::tib_variant("TimeRange"),
    Points = tibblify::tib_variant("Points")
  )
  
  query <- list(TimeSeriesUniqueId = time_series_id)
  
  response <- domain |>
    request("GetTimeSeriesRawData", token, query = query) |>
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
