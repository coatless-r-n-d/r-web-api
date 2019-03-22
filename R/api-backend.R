# CUMTD's API URL
cumtd_api_url = "https://developer.cumtd.com/api"

# TODO: Rewrite in the form of a general API wrapper?

#' Construct and Call a "GET" Request to CUMTD API
#'
#' Builds the "GET" request based on the resource being requested. Once built,
#' the call is initiated.
#'
#' @param endpoint Resource path
#' @param ...      Additional parameters
#' @param key      Authorization
#' @param version  API version to use
#' @param format   Response type
#'
#' @return
#' An `httr` response object.
#'
#' @examples
#' \dontrun{
#' # Requires a key to retrieve data
#' cumtd("getapiusage")
#' }
#' @export
cumtd = function(endpoint,
                 ... ,
                 key = NULL,
                 version = "v2.2",
                 format = c("json", "xml")) {
  # Use supplied key or check environment
  cumtd_check_key(key)
  key = key %||% cumtd_show_key()

  # Add API key to list of optional parameters
  query_params = list(key = key, ...)

  # Require one format
  format = match.arg(format)

  # Show output
  response = httr::GET(paste0(cumtd_api_url, "/", version, "/", format, "/", endpoint),
                       query = query_params)

  valid_status_response(httr::status_code(response))

  convert_response(response)
}

valid_status_response = function(response_status_code) {
  if(response_status_code >= 300) {
    warning("A problem occurred when talking with the API.\n",
            "Check the `stat` value for the issue.")
  }
}

#' Convert Response to R Object
#'
#' Converts the response from JSON to an R `list`/`data.frame`.
#'
#' @param response The result from the API query.
#' @param flatten  Ensure that only one `data.frame`` is returned.
#'
#' @importFrom jsonlite fromJSON validate
#' @export
convert_response = function(response, flatten = TRUE) {
  response_payload = httr::content(response, as = "text")
  if (jsonlite::validate(response_payload)) {
    jsonlite::fromJSON(response_payload, flatten = TRUE)
  } else {
    stop("Converting `XML` responses is not implemented.")
  }
}

