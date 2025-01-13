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
#' ids <- c("27a6b0badd044e0c9b29d589b9e078d9", "11e69f80f4d6474e8f9c07b10b2b83d7")
#' aq_get_time_series_description_list_by_unique_id(ids)
#' }
aq_get_time_series_description_list_by_unique_id <- function(
    time_series_unique_ids,
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_character(time_series_unique_ids)
  chk::chk_vector(time_series_unique_ids)
  chk::chk_length(time_series_unique_ids, 1, Inf)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)

  query <- list(TimeSeriesUniqueIds = time_series_unique_ids)

  response <- domain |>
    request("GetTimeSeriesDescriptionListByUniqueId", token, query = query)
  
  spec <- tibblify::tspec_row(
    tib_variant("TimeSeriesDescriptions")
  )
  
  response <- response |>
    tibblify::tibblify(spec)

  time_series_descriptions_spec <- tibblify::tspec_df(
    tib_chr("Identifier"),
    tib_chr("UniqueId"),
    tib_chr("LocationIdentifier"),
    tib_chr("Parameter"),
    tib_chr("ParameterId"),
    tib_chr("Unit"),
    tib_int("UtcOffset"),
    tib_chr("UtcOffsetIsoDuration"),
    tib_chr("LastModified"),
    tib_chr("RawStartTime"),
    tib_chr("RawEndTime"),
    tib_chr("CorrectedStartTime"),
    tib_chr("CorrectedEndTime"),
    tib_chr("TimeSeriesType"),
    tib_chr("Label", required = FALSE),
    tib_chr("Comment", required = FALSE),
    tib_chr("Description", required = FALSE),
    tib_lgl("Publish", required = FALSE),
    tib_chr("ComputationIdentifier", required = FALSE),
    tib_chr("ComputationPeriodIdentifier", required = FALSE),
    tib_chr("SubLocationIdentifier", required = FALSE),
  )
  
  response <- response |>
    purrr::pluck("TimeSeriesDescriptions") |>
    purrr::pluck(1) |>
    tibblify::tibblify(time_series_descriptions_spec) |>
    identity()

  response
}
