#' Plot Acceleration and Results
#'
#' This function generates a plot of acceleration data with optional mean and binary lines.
#'
#' @title Plot Acceleration and Results
#' @param data A data frame containing the columns "time", "acceleration", "mean", and "binary".
#' @param show_mean Logical. Whether to show the mean line on the plot. Default is TRUE.
#' @param show_binary Logical. Whether to show the binary line on the plot. Default is TRUE.
#' @return A ggplot object displaying the acceleration data and optional mean and binary lines.
#' @examples
#' data <- data.frame(
#'   time = as.POSIXct(seq(1, 100, by = 1), origin = "1970-01-01"),
#'   acceleration = rnorm(100),
#'   mean = rnorm(100),
#'   binary = sample(c(-1, 0, 1), 100, replace = TRUE)
#' )
#' plot_results(data, show_mean = TRUE, show_binary = FALSE)
#' @export
plot_results <- function(data, show_mean = TRUE, show_binary = TRUE) {
  library(ggplot2)
  p <- ggplot(data, aes(x = time)) +
    geom_line(aes(y = acceleration), color = "red", size = 1) +
    labs(title = "Acceleration and Window Results", x = "Time", y = "Value")

  if (show_mean) {
    p <- p + geom_line(aes(y = mean), color = "black", size = 1)
  }
  if (show_binary) {
    p <- p + geom_line(aes(y = binary), color = "grey", size = 1)
  }

  return(p)
}
