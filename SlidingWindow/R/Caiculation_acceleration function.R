#i) a function that combines multiple coordinates into an acceleration vector (Euclidean norm)#' Load and preprocess time series data
#' calculate_acceleration
#' @title Calculate the Euclidean Norm of Acceleration
#' @param file_path Path to the CSV file.
#' @param x_col Name or index of the x-axis column.
#' @param y_col Name or index of the y-axis column.
#' @param z_col Name or index of the z-axis column.
#' @return Data frame with added acceleration vector column.
#' @export


calculate_acceleration <- function(file_path, x_col, y_col, z_col) {
  # Load data
  data <- read.csv(file_path)

  # Convert time column to POSIXct format
  data$time <- as.POSIXct(data$time, origin = "1970-01-01")

  # Calculate Euclidean norm
  data$acceleration <- sqrt(data[[x_col]]^2 + data[[y_col]]^2 + data[[z_col]]^2)

  # Return data frame
  return(data)
}


