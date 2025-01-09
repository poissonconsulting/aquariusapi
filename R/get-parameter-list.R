#' Get Parameter List
#' 
#' @seealso \url{`r aq_documentation("ParameterListServiceRequest")`}
#'
#' @inheritParams params
#'
#' @export
#'
#' @examples
#' \dontrun{
#'  aq_get_parameter_list()
#' }
aq_get_parameter_list <- function(
    ...,
    token = aq_token(),
    domain = aq_domain()) {
  chk::chk_unused(...)
  chk::chk_string(token)
  chk::chk_string(domain)
  
  response <- domain |>
    request("GetParameterList", token) |>
    purrr::pluck("Parameters") |>
    tibblify::tibblify()
}
