### Internal package helpers

# Local version of the null coalescing operator...
`%||%` = function(x, y) if(is.null(x)) y else x

# Verify date is correct
valid_date_format = function(date, date_format = "%Y-%m-%d") {
  tryCatch(
    !is.na(as.Date(date, format = date_format)),
    error = function(e) {
      FALSE
    }
  )
}

# Check if valid date for the API to retrieve history
valid_date_range = function(date_value,
                            start_date = as.Date("2013-02-07", format = date_format),
                            end_date = Sys.Date() - 1,
                            date_format = "%Y-%m-%d") {
  date_value = as.Date(date_value, format = date_format)

  tryCatch(
    !is.na(date_value) &&
      date_value >= start_date &&
      date_value <= end_date,
    error = function(e) {
      FALSE
    }
  )
}

# Remove any parameters that may have NULL or NA values.
construct_request_parameters = function(...) {
  params = list(...)
  params = Filter(Negate(is.null), params)
  Filter(Negate(is.na), params)
}
