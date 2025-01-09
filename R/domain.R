#' Domain
#' 
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#'  aq_domain()
aq_domain <- function(
    domain = getOption("aq.domain", Sys.getenv("AQ_DOMAIN"))) {
  chk::chk_string(domain)
  if(nchar(domain)) {
    return(domain)
  }
  "evr.aquaticinformatics.net"
}
