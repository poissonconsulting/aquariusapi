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
    username = Sys.getenv("AQ_USERNAME"), 
    password = Sys.getenv("BASEROW_PASSWORD")) {
  chk::chk_string(username)
  chk::chk_string(password)
  
  token <- base_url() |>
    file_path("user/token-auth/") |>
    # httr2::request() |> 
    # httr2::req_method("POST") |> 
    # httr2::req_body_json(
    #   list(email = email,
    #        password = password)
    # ) |>
    # user_agent() |>
    # httr2::req_perform() |>
    # httr2::resp_body_json() |>
    # purrr::pluck("token") |>
    identity()
  
  invisible(token)
}
