% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get-time-series-unique-id-list.R
\name{aq_get_time_series_unique_id_list}
\alias{aq_get_time_series_unique_id_list}
\title{Get Time Series Unique ID List}
\usage{
aq_get_time_series_unique_id_list(
  location_identifier = NULL,
  parameter = NULL,
  ...,
  token = aq_token(),
  domain = aq_domain()
)
}
\arguments{
\item{location_identifier}{A string of the location identifier.}

\item{parameter}{A string of the parameter.}

\item{...}{These dots are for future extensions and must be empty.}

\item{token}{A string of the user's authentication token.}

\item{domain}{A string of the domain name.}
}
\description{
Get Time Series Unique ID List
}
\examples{
\dontrun{
aq_get_time_series_unique_id_list()
aq_get_time_series_unique_id_list("LC_DRY_WQ06_TEMP")
aq_get_time_series_unique_id_list(parameter = "Discharge")
aq_get_time_series_unique_id_list("LC_DRY_WQ06_TEMP", parameter = "Discharge")
}
}
\seealso{
\url{https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2/json/metadata?op=TimeSeriesUniqueIdListServiceRequest}
}
