authorization <- function(x, token) {
  httr2::req_headers(x, Authorization = glue::glue("Bearer {token}"))
}

user_agent <- function(x) {
  httr2::req_user_agent(x, "aquariusapi (https://github.com/poissonconsulting/aquariusapi)")
}

request <- function(domain, path_append, token, query = NULL) {
  domain |>
    aq_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append(path_append) |>
    httr2::req_url_query(!!!query) |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}

get_time_series_data <- function(
    time_series_id,
    query_from,
    query_to,
    path_append,
    token,
    domain) {

  query <- list(
    TimeSeriesUniqueId = time_series_id, 
    QueryFrom = query_from,
    QueryTo = query_to,
    GetParts = "PointsOnly")
  
  response <- domain |>
    request(path_append = path_append, token, query = query)
  
  spec <- tibblify::tspec_row(
    tib_int("NumPoints"),
    tib_variant("Points", required = FALSE))
  
  response <- response |>
    tibblify::tibblify(spec)
  
  if(!response$NumPoints) {
    return(dplyr::tibble(Timestamp = character(), Value = double()))
  }
  
  spec_points <- tibblify::tspec_df(
    tib_chr("Timestamp"),
    tib_variant("Value", transform = \(x) unname(unlist(x)), required = FALSE)
  )
  
  response <- response |>
    purrr::pluck("Points") |>
    purrr::pluck(1) |>
    tibblify::tibblify(spec_points) |>
    identity()
  
  response
}
