file_path <- function(...) {
  paste(..., sep = "/")
}

authorization <- function(x, token) {
  httr2::req_headers(x, Authorization = glue::glue("Bearer {token}"))
}

user_agent <- function(x) {
  httr2::req_user_agent(x, "aquariusapi (https://github.com/poissonconsulting/aquariusapi)")
}
