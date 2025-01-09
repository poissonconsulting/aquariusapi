authorization <- function(x, token) {
  httr2::req_headers(x, Authorization = glue::glue("Bearer {token}"))
}

user_agent <- function(x) {
  httr2::req_user_agent(x, "aquariusapi (https://github.com/poissonconsulting/aquariusapi)")
}

request <- function(domain, path_append, token) {
  domain |>
    aq_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append(path_append) |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}