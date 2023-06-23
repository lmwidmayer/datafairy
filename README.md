
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datafairy

<!-- badges: start -->
<!-- badges: end -->

<img src="man/figures/logo.svg" align="right" height="139" />

The datafairy is grants you basic data handling wishes: The packages
includes helper functions for creating minimaistic codebooks or describe
numeric and factor data.

## Installation

You can install the development version of datafairy from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lmwidmayer/datafairy")
```

## Example

This is example shows how to make a codebook template from a flat
dataframe:

``` r
library(datafairy)

## create a codebook
df <- data.frame(
   id = 1:4,
   condition = factor(LETTERS[1:4]),
   score = c(2.1, 4.0, NA, 3.3)
 ) # a dataframe that you want to document
 cb <- mini_cb(df, auto.type = TRUE, content.type = TRUE)

print(cb)
#>        NAME     TYPE UNIT DESCRIPTION ANNOTATION
#> 1   CONTENT CODEBOOK                            
#> 2        id  integer                            
#> 3 condition   factor                            
#> 4     score  numeric
```

You may write the codebook `cb` to a tabular file format or `json` and
populate it with the descriptions of your dataset.  
Note that `content.type = TRUE` adds a row with the name `CONTENT` in
which you can describe to which dataset this codebook belongs.

<!-- devtools::build_readme() -->
