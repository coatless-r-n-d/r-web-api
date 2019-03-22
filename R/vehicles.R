#' Retrieve All CUMTD Vehicles that are Tracked
#'
#' Get information for all currently tracked vehicles.
#'
#' @return A `data.frame` containing the vehicle information with columns:
#'
#' - `vehicle_id	`        Vehicle number associated with vehicle
#' - `trip`                Trip information for the departure
#' - `location`	           The last known latitude and longitude of the vehicle
#' - `previous_stop_id`	   The last stop that the vehicle served
#' - `next_stop_id`	       The next stop that the vehicle will serve
#' - `origin_stop_id`	     The stop where the vehicle began it's trip
#' - `destination_stop_id` The stop where the vehicle will end its trip
#' - `last_updated`	       The last time the vehicle sent a real-time location
#'                         update to our system.
#'
#' @export
#' @references
#' <https://developer.cumtd.com/documentation/v2.2/method/getvehicles/>
get_all_vehicles = function() {
  cumtd("getvehicles")$vehicles
}
