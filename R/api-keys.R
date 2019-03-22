#' Sets, Retrieve, and Check the CUMTD API Key
#'
#' Suite of functions for handling the `CUMTD_KEY` used in API calls.
#'
#' @details
#' Obtain a CUMTD API key from <https://developer.cumtd.com/>
#'
#' @rdname cumtd_key
#'
#' @export
#' @examples
#' cumtd_show_key()
cumtd_show_key = function() {
  Sys.getenv("CUMTD_KEY", "")
}


#' @param key The CUMTD API assigned
#'
#' @rdname cumtd_key
#' @export
#' @examples
#' \dontrun{
#' cumtd_check_key()
#' }
cumtd_check_key = function(key = NULL) {
  key = key %||% cumtd_show_key()

  if (isTRUE(key == "")) {
    bad_cumtd_key()
  }

  invisible(TRUE)
}

#' @rdname cumtd_key
#' @export
#' @examples
#' \dontrun{
#' cumtd_set_key("your-key-here")
#' }
cumtd_set_key = function(key) {

  if (!missing(key) || isTRUE(key == "")) {
    bad_cumtd_key()
  }

  Sys.setenv("CUMTD_KEY" = key)
}


bad_cumtd_key = function() {

  stop(
    "No CUMTD API Key present.\n",
    "Please obtain an API key from:\n",
    "https://developer.cumtd.com/\n",
    .call = FALSE
  )

}
