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
#' aq_get_time_series_description_list()
#' aq_get_time_series_description_list("LC_DRY_WQ06_TEMP")
#' }
aq_get_time_series_description_list <- function(
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
    Parameter = parameter
  )
  
  response <- domain |>
    request("GetTimeSeriesDescriptionList", token, query = query)
  
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
    tib_chr("UtcOffsetIsoDuration", required = FALSE),        
    tib_chr("LastModified", required = FALSE),     
    tib_chr("RawStartTime", required = FALSE),   
    tib_chr("RawEndTime", required = FALSE), 
    tib_chr("CorrectedStartTime", required = FALSE),
    tib_chr("CorrectedEndTime", required = FALSE),        
    tib_chr("TimeSeriesType", required = FALSE),          
    tib_chr("Label", required = FALSE),           
    tib_chr("Comment", required = FALSE),          
    tib_chr("Description", required = FALSE),  
    tib_lgl("Publish", required = FALSE), 
    tib_chr("ComputationIdentifier", required = FALSE), 
    tib_chr("ComputationPeriodIdentifier", required = FALSE),
    tib_chr("SubLocationIdentifier", required = FALSE))

response <- response |>
  purrr::pluck("TimeSeriesDescriptions") |>
  purrr::pluck(1) |>
  tibblify::tibblify(time_series_descriptions_spec) |>
  identity()

response
}
