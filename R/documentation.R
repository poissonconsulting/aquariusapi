#' Documentation
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' aq_documentation("GetAuthTokenServiceRequest")
aq_documentation <- function(
    path_append,
    ...,
    domain = aq_domain()) {
  chk::chk_string(path_append)
  chk::chk_unused(...)
  chk::chk_string(domain)
  domain |>
    aq_url() |>
    paste0("/json/metadata?op=", path_append)
}
