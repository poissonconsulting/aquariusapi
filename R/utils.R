base_url <- function() {
  "https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2"
}

file_path <- function(...) {
  paste(..., sep = "/")
}
# 
# generate_request <- function(query_params,
#                              session_append,
#                              token) {
#   base_url() |>
#     httr2::request() |>
#     httr2::req_method("GET") |>
#     httr2::req_url_path_append(session_append) |>
#     httr2::req_url_query(!!!query_params) |>
#     httr2::req_headers(Authorization = paste("Bearer", token)) |>
#     httr2::req_user_agent("aquarius2r")
# }
# 
# send_request <- function(query_params,
#                          session_append,
#                          token,
#                          verbosity = 0) {
#   
#   query_params |> 
#     generate_request(session_append, token) |>
#     httr2::req_perform(verbosity = verbosity) |>
#     httr2::resp_body_json()
# }
