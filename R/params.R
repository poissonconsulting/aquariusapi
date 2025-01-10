#' Parameter Descriptions for aquarius2r Package
#'
#' Default parameter descriptions which may be overridden in individual
#' functions.
#'
#' A flag is a non-missing logical scalar.
#'
#' A string is a non-missing character scalar.
#' 
#' A date is a non-missing character scalar.
#
#' @inheritParams rlang::args_dots_empty
#' @param domain A string of the domain name.
#' @param location_identifier A string of the location identifier.
#' @param parameter A string of the parameter.
#' @param password A string of the user's password.
#' @param path_append A string to append to the URL path.
#' @param time_series_id A string of time series ID.
#' @param time_series_ids A character vector of the time series ID.
#' @param token A string of the user's authentication token.
#' @param query_from A date of the start of the period of interest.
#' @param query_to A date of the end of the period of interest.
#' @param username A string of the user name.
#' @return A tibble.
#' @keywords internal
#' @aliases parameters arguments args
#' @usage NULL
# nocov start
params <- function(...) NULL
# nocov end
