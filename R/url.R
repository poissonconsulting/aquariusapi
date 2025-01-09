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
  file.path("https:/", domain, "AQUARIUS/Publish/v2")
}
