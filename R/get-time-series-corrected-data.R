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
  
  get_time_series_data(
    time_series_id = time_series_id,
    query_from = query_from,
    query_to = query_to,
    path_append = "GetTimeSeriesCorrectedData",
    token = token,
    domain = domain)
}
