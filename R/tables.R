#' Get Tables for Aquarius Database
#'
#' @inheritParams params
#'
#' @return A tibble with xx
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_tables()
#' }
aq_tables <- function(token = aq_token()) {
  chk::chk_string(token)
  
 #  base_url() |>
 #    file_path(glue::glue("database/tables/database/")) |>
 #    request(token) |>
 #    print() |>
 # #   list_to_tibble()
 #    identity()
}
