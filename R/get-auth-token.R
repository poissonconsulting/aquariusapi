#' Get Authorization Token
#'
#' Generates an temporary authorization token from the Aquarius API for a supplied
#' username and password.
#' 
#' \url{`r aq_documentation("GetAuthTokenServiceRequest")`}
#' 
#' @inheritParams params
#'
#' @return A character string of the temporary authorization token
#' @export
#'
#' @examples
#' \dontrun{
#'   aq_get_auth_token()
#' }
aq_get_auth_token <- function(
    username = getOption("aq.username", Sys.getenv("AQ_USERNAME")), 
    password = getOption("aq.password", Sys.getenv("AQ_PASSWORD")),
    domain = aq_domain()) {
  
  chk::chk_string(username)
  chk::chk_string(password)
  chk::chk_string(domain)
  
  token <- domain |>
    aq_url() |>
    httr2::request() |>
    httr2::req_method("POST") |> 
    httr2::req_url_path_append("session") |>
    httr2::req_body_form(
      Username = username,
      EncryptedPassword = password
    ) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_string()
  
  invisible(token)
}

#' @describeIn aq_get_auth_token Get Temporary Authorization Token
#' @export
aq_token <- function(
    username = getOption("aq.username", Sys.getenv("AQ_USERNAME")), 
    password = getOption("aq.password", Sys.getenv("AQ_PASSWORD"))) {
  aq_get_auth_token(username = username, password = password)
}
