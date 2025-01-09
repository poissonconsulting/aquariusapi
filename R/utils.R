file_path <- function(...) {
  paste(..., sep = "/")
}

base_url <- function(domain) {
  file_path("https:/", domain, "AQUARIUS/Publish/v2")
}

authorization <- function(x, token) {
  httr2::req_headers(x, Authorization = glue::glue("Bearer {token}"))
}

user_agent <- function(x) {
  httr2::req_user_agent(x, "aquariusapi (https://github.com/poissonconsulting/aquariusapi)")
}
