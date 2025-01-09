#' URL
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' aq_url("poissonconsulting.aquaticinformatics.net")
aq_url <- function(domain = aq_domain()) {
  chk::chk_string(domain)

  paste0("https://", domain, "/AQUARIUS/Publish/v2")
}
