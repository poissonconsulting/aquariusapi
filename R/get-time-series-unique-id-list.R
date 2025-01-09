#' Get Time Series Unique ID List
#'
#' @seealso \url{`r aq_documentation("TimeSeriesUniqueIdListServiceRequest")`}
#' 
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_time_series_unique_id_list()
#' }
aq_get_time_series_unique_id_list <- function(
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  domain |>
    request("GetTimeSeriesUniqueIdList", token) |>
    purrr::pluck("TimeSeriesUniqueIds") |>
    tibblify::tibblify() |>
    identity()
}
