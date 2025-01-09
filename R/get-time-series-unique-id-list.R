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
#' aq_get_time_series_unique_id_list()
#' }
aq_get_time_series_unique_id_list <- function(
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)

  response <- domain |>
    request("GetTimeSeriesUniqueIdList", token) 
  
  response <- response |>
    purrr::pluck("TimeSeriesUniqueIds") |>
    tibblify::tibblify() |>
    identity()
  
  response
}
