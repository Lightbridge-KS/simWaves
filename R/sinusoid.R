

# Sim: Sine Waves ---------------------------------------------------------


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


# Sim: Sine Waves + Linear Model ---------------------------------------------------------


#' Simulate Sinusoidal Wave with Linear Model to Data Frame
#'
#' Similar to [sim_sinusoid()], This function simulates sinusoidal wave, also, plus "linear model" to a data in a data frame format for further plotting.
#' You can input parameters such as number of cycle to simulate (`n`), wave length, amplitude, and ranges of data to simulate.
#' To add linear trend to the existing waves, you can specify arguments to adjust slope, y-intercept, and random error term.
#'
#'
#' @param f (character or symbol) Function to simulate data from. By default, use `sin()` waves. Any trigonometric functions can be provided.
#' @param n (numeric) Number of cycle to simulate
#' @param lambda (numeric) Wave length in x-axis, if provided, will override `n`
#' @param amp (numeric) Amplitude of wave
#' @param xmin (numeric) Lower boundary of `x` in the output data
#' @param xmax (numeric) Upper boundary of `x` in the output data
#' @param by (numeric) Number to increment `x` by
#' @param slope (numeric) Slope of the linear model to add to the waveform
#' @param y_intercept (numeric) Y-intercept of the linear model to add to the waveform
#' @param epsilon_sd If provided as numeric, it is a standard deviation of an error term sampled from Gaussian distribution with `mean = 0`
#'
#' @return A data.frame with column: `x` and `y`
#' @export
#'
#' @examples
#' ## Sine waves with upward linear trend
#' df_sin2 <- sim_sinusoid_lm(n = 5, slope = 1, epsilon_sd = 0.05)
#' plot(df_sin2, type = "l")
sim_sinusoid_lm <- function(f = "sin", # function to simulate
                            n = 1, # Number of Cycle
                            lambda = NULL, # If provided, override `n`
                            amp = 1, # Amplitude
                            xmin = 0, # Min in x-axis
                            xmax = 2*pi, # Max in x-axis
                            by = 0.05, # Increment x by
                            slope = 0,
                            y_intercept = 0,
                            epsilon_sd = NULL # Stdev of Error term
) {

  # Wave Length
  lambda <- if(is.null(lambda)){
    (xmax-xmin)/n
  } else {
    lambda
  }
  # Degree per cycle
  deg_per_cycle <- (2*pi)/lambda

  # Generate X
  x <- seq(xmin, xmax, by = by)
  # Generate Y wave
  y_base <- do.call(f, list(deg_per_cycle * x))
  y_wave <- amp * y_base

  # Generate Y linear model
  y_lin <- slope * x + y_intercept

  # Error term (Optional)
  epsilon <- if (!is.null(epsilon_sd)) {
    stats::rnorm(length(x), mean = 0, sd = epsilon_sd)
  } else {
    0L
  }

  y <- y_wave + y_lin + epsilon

  data.frame(x = x, y = y)

}
