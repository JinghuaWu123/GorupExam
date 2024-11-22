#ii) a functions that take a series of data (referred to as window) and returns a value
#' @title Sliding Window Function
#' @param vector Input vector (acceleration data).
#' @param window_size Size of the window.
#' @param threshold Threshold value for acceleration change.
#' @return A list with mean and binary values.
#' @export


window_function <- function(vector, window_size, threshold) {
  results <- list()
  n <- length(vector)

  # Go through the whole vector
  for (i in seq(1, n - window_size + 1)) {
    window <- vector[i:(i + window_size - 1)]
    max_diff <- max(window) - min(window)

    # Check whether the threshold is exceeded
    if (max_diff > threshold) {
      results$mean[i] <- mean(window)
      results$binary[i] <- ifelse(diff(window)[1] > 0, 1, -1)
    } else {
      results$mean[i] <- NA
      results$binary[i] <- 0
    }
  }

  return(results)
}
