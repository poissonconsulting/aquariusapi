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
#' aq_get_time_series_unique_id_list("LC_DRY_WQ06_TEMP")
#' aq_get_time_series_unique_id_list(parameter = "Discharge")
#' aq_get_time_series_unique_id_list("LC_DRY_WQ06_TEMP", parameter = "Discharge")
#' }
aq_get_time_series_unique_id_list <- function(
    location_identifier = NULL,
    parameter = NULL,
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_null_or(location_identifier, vld = chk::vld_string)
  chk::chk_null_or(parameter, vld = chk::vld_string)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  query <- list(
    LocationIdentifier = location_identifier, 
    Parameter = parameter)

  response <- domain |>
    request("GetTimeSeriesUniqueIdList", token, query = query)
  
  time_series_unique_ids_spec <- tibblify::tspec_df(
    tib_chr("UniqueId", required = FALSE)
  )
  
  response <- response |>
    purrr::pluck("TimeSeriesUniqueIds") |>
    tibblify::tibblify(time_series_unique_ids_spec) |>
    identity()

  response
}
