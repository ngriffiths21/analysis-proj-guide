#' Calculate standard error of the mean
ex_std_error <- function(x) {
  n <- length(x)
  sd(x) / sqrt(n)
}
