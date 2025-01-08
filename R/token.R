#' Get Aquarius Token
#'
#' Generates an temporary authentication token from the Aquarius API for a supplied
#' username and password.
#' 
#' @inheritParams params
#'
#' @return A character string of the temporary access token
#' @export
#'
#' @examples
#' \dontrun{
#'   aq_token()
#' }
aq_token <- function(
    username = getOption("aq.username", Sys.getenv("AQ_USERNAME")), 
    password = getOption("aq.password", Sys.getenv("AQ_PASSWORD"))) {

  chk::chk_string(username)
  chk::chk_string(password)

  token <- base_url() |>
    file_path("session") |>
    httr2::request() |>
    httr2::req_method("POST") |> 
    httr2::req_body_form(
      username = username,
      encryptedPassword = password
    ) |>
    httr2::req_perform() |>
    httr2::resp_body_string()
  
   invisible(token)
}
