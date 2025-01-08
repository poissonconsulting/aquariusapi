base_url <- function() {
  "https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2"
}

file_path <- function(...) {
  paste(..., sep = "/")
}

authorization <- function(x, token) {
  httr2::req_headers(x, Authorization = glue::glue("Bearer {token}"))
}
