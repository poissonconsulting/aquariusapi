#' Get Time Series Corrected Data
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
    query_from = NULL,
    query_to = NULL,
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(time_series_id)
  chk::chk_null_or(query_from, vld = chk::chk_date)
  chk::chk_null_or(query_to, vld = chk::chk_date)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  query <- list(
    TimeSeriesUniqueId = time_series_id, 
    QueryFrom = query_from,
    QueryTo = query_to,
    GetParts = "PointsOnly")
  
  response <- domain |>
    request("GetTimeSeriesCorrectedData", token, query = query)
  
  spec <- tibblify::tspec_row(
    tib_int("NumPoints"),
    tib_variant("Points", required = FALSE))
  
  response <- response |>
    tibblify::tibblify(spec)
  
  if(!response$NumPoints) {
    return(dplyr::tibble(Timestamp = character(), Value = double()))
  }
  
  spec_points <- tibblify::tspec_df(
    tib_chr("Timestamp"),
    tib_variant("Value", transform = \(x) unname(unlist(x)), required = FALSE)
  )
  
  response <- response |>
    purrr::pluck("Points") |>
    purrr::pluck(1) |>
    tibblify::tibblify(spec_points) |>
    identity()
  
  response
}
