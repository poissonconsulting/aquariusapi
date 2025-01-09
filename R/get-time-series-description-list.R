#' Get Time Series Description List
#'
#' @seealso \url{`r aq_documentation("TimeSeriesDescriptionServiceRequest")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_time_series_description_list()
#' }
aq_get_time_series_description_list <- function(
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  response <- domain |>
    request("GetTimeSeriesDescriptionList", token) |>
    purrr::pluck("TimeSeriesDescriptions") |>
    tibblify::tibblify() |>
    identity()
  
  response
}
