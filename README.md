
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lab3

<!-- badges: start -->

[![R-CMD-check](https://github.com/Jonatanprepuk/lab3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Jonatanprepuk/lab3/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of lab3 is to create our first R package with Euclidean
algorithm and Dijkstra’s algorithm.

## Installation

You can install the development version of lab3 from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("Jonatanprepuk/lab3")
```

## Example

This is a basic example which shows you how to compute greatest common
divisor:

``` r
library(lab3)
euclidean(1374, 32)
#> [1] 2
```

This is a basic example which shows how to compute the shortest path in
a graph:
