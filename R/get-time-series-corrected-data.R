#' Get Location Data
#'
#' @seealso \url{`r aq_documentation("TimeSeriesDataCorrectedServiceRequest")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#' aq_get_time_series_corrected_data("27a6b0badd044e0c9b29d589b9e078d9")
#' }
aq_get_time_series_corrected_data <- function(
    time_series_id,
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(time_series_id)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  query <- list(TimeSeriesUniqueId = time_series_id)
  
  response <- domain |>
    request("GetTimeSeriesCorrectedData", token, query = query) 
  
  spec <- tibblify::tspec_row(
    tib_chr("UniqueId"),
    tib_chr("Parameter"),
    tib_chr("Label"),
    tib_chr("LocationIdentifier"),
    tib_int("NumPoints"),
    tib_chr("Unit"),
    tibblify::tib_variant("TimeRange"),
    tibblify::tib_variant("Points")
  )
  
  response <- response |>
    tibblify::tibblify(spec)
  
  spec_points <- tibblify::tspec_df(
    tib_chr("Timestamp"),
    tib_variant("Value", transform = \(x) unname(unlist(x)))
  )
  
  spec_time_range <- tibblify::tspec_df(
    tib_chr("StartTime"),
    tib_chr("EndTime")
  )
  
  points <- response$Points |>
    purrr::pluck(1) |>
    tibblify::tibblify(spec_points)
  
  time_range <- response$TimeRange |>
    tibblify::tibblify()
  
  response <- response |>
    dplyr::select(!c("Points", "TimeRange")) |>
    dplyr::bind_cols(time_range) |>
    dplyr::cross_join(points) |>
    identity()
  
  response
}
