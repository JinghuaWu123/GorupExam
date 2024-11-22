#iii) a function that goes iteratively through the time series and runs the previously created window function at each iteration
#' Iterate Over Time Series
#' @title Iterate Over Time Series
#' @param data Data frame with acceleration data.
#' @param window_function Window function to apply.
#' @param window_size Size of the window.
#' @param threshold Threshold for window function.
#' @return Data frame with added mean and binary columns.
#' @export

Iterate_time_series <- function(data, window_function, window_size, threshold) {
  n <- nrow(data)  # total rows of dataset

  # Initialize result columns with NA
  data$mean <- rep(NA, n)
  data$binary <- rep(NA, n)

  # Iterate over the time series, calculate results for each window
  for (i in seq(1, n - window_size + 1)) {
    # Extract the current window
    window <- data$acceleration[i:(i + window_size - 1)]

    # Apply the window function
    result <- window_function(window, window_size, threshold)

    # Store the results
    data$mean[i] <- result$mean
    data$binary[i] <- result$binary
  }

  # Return the modified dataset
  return(data)
}
