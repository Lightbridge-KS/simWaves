
<!-- README.md is generated from README.Rmd. Please edit that file -->

# simWaves

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

> Simulate Waveform to a data frame

## Installation

You can install the development version of simWaves from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Lightbridge-KS/simWaves")
```

## Simulate Trigonometric Waves

``` r
library(simWaves)
```

### Basic Sinusoid Waves

`sim_sinusoid` will simulate any waves from a given function
(e.g. trigonometric functions).

Let’s start with 1 sine wave.

``` r
# Simulate to a data frame
df1 <- sim_sinusoid("sin", n = 1)
# Plot
plot(df1, type = "l")
```

<img src="man/figures/README-sim_sin_1-1.png" width="100%" /> Now, I’ll
change simulating function to `cos` with wavelength 2 and amplitude 3.

``` r
df2 <- sim_sinusoid("cos", lambda = 2, amp = 3)
plot(df2, type = "l")
```

<img src="man/figures/README-sim_sin_2-1.png" width="100%" />

### Sinusoid Waves + Linear Models

You can use `sim_sinusoid_lm()` to simulate sinusoidal wave, also, add
linear model ontop.

Let’s create 10 sine waves plus linear model with slope 1 and some
random error.

``` r
df3 <- sim_sinusoid_lm("sin", n = 10, slope = 1, epsilon_sd = 0.1, by = 0.01)
plot(df3, type = "l")
```

<img src="man/figures/README-sim_sinusoid_lm_1-1.png" width="100%" />
