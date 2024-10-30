
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Retrieving Data from a Custom Web API

<!-- badges: start -->

[![R-CMD-check](https://github.com/coatless-r-n-d/r-web-api/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/coatless-r-n-d/r-web-api/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `cumtd` *R* package provides an example of implementing and using a
Web API. In particular, the package is a case study in retrieving data
from the [Champaign-Urbana Mass Transit District
(‘CUMTD’)](https://developer.cumtd.com/) Web API, which provides
realtime information for buses. Writing a custom wrapper to the API was
necessary since there is not a realtime [General Transit Feed
Specification
(GTFS)](http://code.google.com/transit/spec/transit_feed_specification.html)
available via [GTFS
Realtime](https://developers.google.com/transit/gtfs-realtime/). Thus,
for those wanting to know if their bus will arrive on time, one must
look elsewhere.

As a follow-up, the package is used in
[`r-shinydashboard`](https://github.com/r-pkg-examples/r-shinydashboard)
example to illustrate how a real-time API can be used with
[`shinydashboard`](https://rstudio.github.io/shinydashboard/index.html).

### Installation

To install the `cumtd` package, use:

``` r
if(!requireNamespace("remotes")) install.packages("remotes")
remotes::install_github("coatless-r-n-d/r-web-api")
```

To access its contents, load it into *R* with:

``` r
library("cumtd")
```

### Endpoints

We have support presently for:

| Implemented Functions         |
|:------------------------------|
| classify_departure_status     |
| convert_response              |
| cumtd                         |
| cumtd_check_key               |
| cumtd_set_key                 |
| cumtd_show_key                |
| get_all_routes                |
| get_all_stops                 |
| get_all_vehicles              |
| get_api_usage                 |
| get_departures_by_stop        |
| get_route_shape               |
| get_route_shape_between_stops |

End points to be added (PRs appreciated!):

| End Point Documentation |
|:---|
| [GetCalendarDatesByDate](https://developer.cumtd.com/documentation/v2.2/method/getcalendardatesbydate) |
| [GetCalendarDatesByService](https://developer.cumtd.com/documentation/v2.2/method/getcalendardatesbyservice) |
| [GetNews](https://developer.cumtd.com/documentation/v2.2/method/getnews) |
| [GetReroutes](https://developer.cumtd.com/documentation/v2.2/method/getreroutes) |
| [GetReroutesByRoute](https://developer.cumtd.com/documentation/v2.2/method/getreroutesbyroute) |
| [GetRoute](https://developer.cumtd.com/documentation/v2.2/method/getroute) |
| [GetRoutesByStop](https://developer.cumtd.com/documentation/v2.2/method/getroutesbystop) |
| [GetStop](https://developer.cumtd.com/documentation/v2.2/method/getstop) |
| [GetStopsByLatLon](https://developer.cumtd.com/documentation/v2.2/method/getstopsbylatlon) |
| [GetStopsBySearch](https://developer.cumtd.com/documentation/v2.2/method/getstopsbysearch) |
| [GetStopTimesByTrip](https://developer.cumtd.com/documentation/v2.2/method/getstoptimesbytrip) |
| [GetStopTimesByStop](https://developer.cumtd.com/documentation/v2.2/method/getstoptimesbystop) |
| [GetPlannedTripsByLatLon](https://developer.cumtd.com/documentation/v2.2/method/getplannedtripsbylatlon) |
| [GetPlannedTripsByStops](https://developer.cumtd.com/documentation/v2.2/method/getplannedtripsbystops) |
| [GetTrip](https://developer.cumtd.com/documentation/v2.2/method/gettrip) |
| [GetTripsByBlock](https://developer.cumtd.com/documentation/v2.2/method/gettripsbyblock) |
| [GetTripsByRoute](https://developer.cumtd.com/documentation/v2.2/method/gettripsbyroute) |
| [GetVehicle](https://developer.cumtd.com/documentation/v2.2/method/getvehicle) |
| [GetVehiclesByRoute](https://developer.cumtd.com/documentation/v2.2/method/getvehiclesbyroute) |
| [GetLastFeedUpdate](https://developer.cumtd.com/documentation/v2.2/method/getlastfeedupdate) |

### Implementation Details

When trying to import data into *R* from a Web API, the preferred
approach is to use [`httr`](https://cran.r-project.org/package=httr) or
[`curl`](https://cran.r-project.org/package=curl). Using either of these
packages, one can form HTTP requests to send to the Web API and receive
HTTP responses from it that contain the data. Inside the response, there
is a body portion that contains the desired data and needs to be
converted into an *R* data structure.

### License

GPL (\>= 2)
