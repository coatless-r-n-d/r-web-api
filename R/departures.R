#' Retrieve a List of CUMTD Bus Departures
#'
#' Get a list of real-time departures for a specific `stop_id`.
#'
#' @param stop_id	  (required) id of the stop (ex. IT:1 or IT)
#' @param route_id  (optional) vector of route ids
#' @param pt	      (optional) preview time in minutes between 0 and 60 (30 by default)
#' @param count	    (optional) maximum number of departures you would like to recieve
#'
#' @return
#' A `data.frame` with departure information for a specific stop:
#'
#' - `destination`	 trip's destination stop
#' - `expected`	     expected departure time of the bus for the given stop
#' - `expected_mins` number of minutes before expected departure time
#' - `headsign`	     information usually shown on headsign
#' - `location`	     latitude and longitude of vehicle
#' - `is_monitored`	 whether the vehicle is communicating
#' - `is_scheduled`	 whether this trip was scheduled
#' - `is_istop`	     if this trip can be boarded without a fare/pass
#' - `origin`	       trip's origin stop
#' - `route`     	   route information for the trip
#' - `scheduled`	   scheduled departure time of the bus for the given stop
#' - `stop_id`	     id of the stop the bus will be at
#' - `trip`	         trip information for the departure
#' - `vehicle_id`	   id associated with vehicle
#'
#' @export
get_departures_by_stop = function(stop_id,
                          route_id = NULL, pt = NULL, count = NULL) {

  # Construct arguments
  args = construct_request_parameters(endpoint = "getdeparturesbystop",
                                      stop_id = stop_id,
                                      route_id = route_id, pt = pt, count = count)

  # Retrieve departures
  departures_info = do.call(cumtd, args)$departures

  if(length(departures_info) == 0) {
    stop("The `stop_id` corresponds to an inactive bus stop.\n",
         "Please try another `stop_id`.", .call = FALSE)
  }

  # Add class information
  class(departures_info) = c("cumtd_departures", "data.frame")

  # Return result
  departures_info
}

#' Classify CUMTD Bus Departures Status
#'
#' Provides quick computations for
#'
#' @param departures_info Results returned from [cumtd::get_departures_by_stop()].
#'
#' @return An augmented `data.frame` that includes:
#'
#' - `late`          is the bus late
#' - `delay`         any delay?
#'
#' @export
#' @examples
#' \dontrun{
#' # Retrieve departure information from API
#' departures = get_departures_by_stop("iu")
#'
#' # Add columns related to late and delay amount.
#' classified_departures = classify_departure_status(departures)
#' }
classify_departure_status = function(departures_info) {

  # Verify departure information is intact from API call.
  if(!inherits(departures_info, "cumtd_departures")) {
    stop("`departures_info` must be derived from `get_departures_by_stop()`",
         .call = FALSE)
  }

  # Convert schedule and expected times into a DateTime object
  departures_info$scheduled = as.POSIXct(departures_info$scheduled, format = "%Y-%m-%dT%H:%M:%S")
  departures_info$expected = as.POSIXct(departures_info$expected, format = "%Y-%m-%dT%H:%M:%S")

  # Determine if the bus is running late. (It's never early.)
  departures_info$late = departures_info$scheduled < departures_info$expected

  # How delayed is the bus?
  departures_info$delay = difftime(departures_info$expected, departures_info$scheduled)

  # Return
  departures_info
}
