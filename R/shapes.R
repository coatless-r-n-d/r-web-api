#' Retrieve CUMTD Route Shapes
#'
#' Get a list of points that define the shape of the route on a map.
#'
#' @param shape_id (required) id of the shape
#'
#' @return A `data.frame` containing the route information with columns:
#'
#' - `shape_dist_traveled` total distance traveled to this point
#' - `shape_pt_lat`        latitude of point
#' - `shape_pt_lon`	       longitude of point
#' - `stop_id`	           the stop id associeated with the shape point.
#' - `shape_pt_sequence`	 sequence of point in GTFS feed
#'
#' @export
#' @references
#' <https://developer.cumtd.com/documentation/v2.2/method/getshape/>
get_route_shape = function(shape_id) {
  cumtd("getshape", shape_id = shape_id)$shape
}

#' Retrieve CUMTD Route Shapes Between Stops
#'
#' Get a list of points that define part of a shape on a map between two stops.
#'
#' @inheritParams get_route_shape
#' @param begin_stop_id	(required) id of the beginning stop point
#' @param end_stop_id	(required) id of the ending stop point
#'
#' @return A `data.frame` containing the route information with columns:
#'
#' - `shape_dist_traveled` total distance traveled to this point
#' - `shape_pt_lat`        latitude of point
#' - `shape_pt_lon`	       longitude of point
#' - `stop_id`	           the stop id associeated with the shape point.
#' - `shape_pt_sequence`	 sequence of point in GTFS feed
#'
#' @export
#' @references
#' <https://developer.cumtd.com/documentation/v2.2/method/getshape/>
get_route_shape_between_stops = function(begin_stop_id, end_stop_id, shape_id) {
  cumtd("getshapebetweenstops",
            begin_stop_id = begin_stop_id,
            end_stop_id = end_stop_id,
            shape_id = shape_id)$shapes
}
