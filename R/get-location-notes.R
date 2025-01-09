#' Get Location Notes
#'
#' @seealso \url{`r aq_documentation("GetLocationNotes")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_location_notes("LC_DRY_WQ06_TEMP")
#' }
aq_get_location_notes <- function(
    location_id, 
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_string(location_id)
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  spec <- tibblify::tspec_row(
    LocationName = tib_chr("LocationName"),
    LocationIdentifier = tib_chr("LocationIdentifier"),
    LocationUniqueId = tib_chr("LocationUniqueId"),
    LocationNotes = tibblify::tib_variant("LocationNotes")
  )
  
  response <- domain |>
    aq_url() |>
    httr2::request() |>
    httr2::req_method("GET") |>
    httr2::req_url_path_append("GetLocationNotes") |>
    httr2::req_url_query(!!!list(LocationIdentifier = location_id)) |>
    authorization(token) |>
    user_agent() |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    tibblify::tibblify(spec) |>
    identity()
  
  location_notes <- response$LocationNotes |>
    tibblify::tibblify()
  
  response |>
    dplyr::select(!"LocationNotes") |>
    dplyr::bind_cols(location_notes) |>
    identity()
}
