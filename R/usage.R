#' Retrieve API Usage for specific methods
#'
#' Get a summary of the API usage for your key.
#'
#' @param method	    (optional) a single API method for which you want data
#'                    (e.g. GetDeparturesByStop)
#' @param version	    (optional) a single API version for which you want data
#'                    (e.g. 2.1)
#' @param start_date	(optional) the first day for which you want data, in
#'                    YYYY-MM-DD format (cannot be earlier than 2013-02-07)
#' @param end_date	  (optional) the last day for which you want data, in
#'                    YYYY-MM-DD format (cannot be later than yesterday)
#'
#' @return
#'
#' - `date`	    a date in YYYY-MM-DD format
#' - `calls`	  the number of requests made to a method
#' - `versions`	a list of versions of the API that were used on a given date
#' - `number`	  an API version number
#' - `methods`	a list of API methods that were used on a given date and within a given API version
#' - `name`   	the name of an API method
#'
#' @export
get_api_usage = function(method = NULL, version = NULL,
                         start_date = NULL, end_date = NULL) {

  # Filter any parameter not found
  args = construct_request_parameters(endpoint = "getapiusage",
                                      method = method,
                                      version = version,
                                      start_date = start_date,
                                      end_date = end_date)

  # Check information
  if(all(c("start_date", "end_date") %in% names(args))) {
    stopifnot(valid_date_format(start_date) && valid_date_format(end_date))
    stopifnot(valid_date_range(start_date) && valid_date_range(end_date))
  }

  do.call(cumtd, args = args)$days
}

