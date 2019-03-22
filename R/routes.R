#' Retrieve CUMTD Routes
#'
#' Obtains a list of CUMTD routes
#'
#' @return A `data.frame` containing the route information with columns:
#'
#' - `route_color`	    hex color of route
#' - `route_id`	        id of route
#' - `route_long_name`	long name
#' - `route_short_name`	short name
#' - `route_text_color`	hex color of route text
#'
#' @export
#' @references
#' <https://developer.cumtd.com/documentation/v2.2/method/getroutes/>
get_all_routes = function() {
  cumtd("getroutes")$routes
}
