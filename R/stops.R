#' Retrieve CUMTD Bus Stop Locations
#'
#' Obtains a list of CUMTD bus stop locations
#'
#' @return A `data.frame` containing the route information with columns:
#'
#' - `code`	      text message code
#' - `stop_point` stop points that compose a parent stop
#' - `stop_id`	  id of stop
#' - `stop_lat`	  latitude of stop
#' - `stop_lon`	  longitude of stop
#' - `stop_name`	name of stop
#'
#' @export
#' @references
#' <https://developer.cumtd.com/documentation/v2.2/method/getstops/>
get_all_stops = function() {
  cumtd("getstops")$stops
}
