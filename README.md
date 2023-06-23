
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datafairy

<!-- badges: start -->

[![R-CMD-check](https://github.com/lmwidmayer/datafairy/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/lmwidmayer/datafairy/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

<img src="man/figures/logo.svg" align="right" height="139" />

The datafairy grants you basic data handling wishes: The packages
includes helper functions for creating minimalist codebooks or
describing numeric and factor data.

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

Write the codebook `cb` to a tabular file format or `json` and populate
it with the descriptions of your data set:

- `NAME`: The column/ variable name of the input dataframe.
- `TYPE`: Data type of the variable: If `auto.type = TRUE`, the function
  will use `R`’s data types.
- `UNIT`: Unit of measurement.
- `DESCRIPTION`: Describe what the variable contains.
- `ANNOTATION`: Further comments on the variable.

Note that `content.type = TRUE` adds a row with the name `CONTENT` in
which you can describe to which data set this codebook belongs.

<!-- devtools::build_readme() -->

## Citation

``` r
citation("datafairy")
#> 
#> Widmayer L (2023). _datafairy: A tiny data handling assistant_. R
#> package version 0.0.0.9001, <URL:
#> https://github.com/lmwidmayer/datafairy>.
#> 
#> Ein BibTeX-Eintrag für LaTeX-Benutzer ist
#> 
#>   @Manual{,
#>     title = {datafairy: A tiny data handling assistant},
#>     author = {Lisa Widmayer},
#>     year = {2023},
#>     url = {https://github.com/lmwidmayer/datafairy},
#>     note = {R package version 0.0.0.9001},
#>   }
```
