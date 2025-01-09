#' Get Time Series Unique ID List
#'
#' \url{https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2/json/metadata?op=TimeSeriesUniqueIdListServiceRequest}
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
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(token)
  chk::chk_string(domain)
  
  domain |>
    aq_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append("GetTimeSeriesUniqueIdList") |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    purrr::pluck("TimeSeriesUniqueIds") |>
    tibblify::tibblify() |>
    identity()
}
