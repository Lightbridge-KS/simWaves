#' Simulate Sinusoidal Wave to Data Frame
#'
#' This function simulates sinusoidal wave data in a data frame format for further plotting. User can specify which trigonometric functions to simulate data from.
#' You can input parameters such as number of cycle to simulate (`n`), wave length, amplitude, and ranges of data to simulate.
#'
#'
#' @param f (character or symbol) Function to simulate data from. By default, use `sin()` waves. Any trigonometric functions can be provided.
#' @param n (numeric) Number of cycle to simulate
#' @param lambda (numeric) Wave length in x-axis, if provided, will override `n`
#' @param amp (numeric) Amplitude of wave
#' @param xmin (numeric) Lower boundary of `x` in the output data
#' @param xmax (numeric) Upper boundary of `x` in the output data
#' @param by (numeric) Number to increment `x` by
#'
#' @return A data.frame with column: `x` and `y`
#' @export
#'
#' @examples
#' # Sinwaves with 2 cycle, amplitude = 3
#' df_sin1 <- sim_sinusoid("sin", n = 2, amp = 3)
#' plot(df_sin1, type = "l")
sim_sinusoid <- function(f = "sin", # function to simulate
                         n = 1, # Number of Cycle
                         lambda = NULL, # If provided, override `n`
                         amp = 1, # Amplitude
                         xmin = 0, # Min in x-axis
                         xmax = 2*pi, # Max in x-axis
                         by = 0.05 # Increment x by
){
  # Wave Length
  lambda <- if(is.null(lambda)){
    (xmax-xmin)/n
  } else {
    lambda
  }
  # Degree per cycle
  deg_per_cycle <- (2*pi)/lambda
  # Generate `x` & `y`
  x <- seq(xmin, xmax, by = by)
  y_base <- do.call(f,list(deg_per_cycle * x))

  y <- amp * y_base

  data.frame(x = x, y = y)
}
