#' Get Time Series Description
#'
#' @seealso \url{`r aq_documentation("TimeSeriesDescriptionListByUniqueIdServiceRequest")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#' aq_get_time_series_description_list_by_unique_id("27a6b0badd044e0c9b29d589b9e078d9")
#' }
aq_get_time_series_description_list_by_unique_id <- function(
    time_series_ids,
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_character(time_series_ids)
  chk::chk_vector(time_series_ids)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)

  query <- list(TimeSeriesUniqueIds = time_series_ids)

  response <- domain |>
    request("GetTimeSeriesDescriptionListByUniqueId", token, query = query)
  
  response <- response |>
    purrr::pluck("TimeSeriesDescriptions") |>
    tibblify::tibblify() |>
    identity()

  response
}
