
<!-- README.md is generated from README.Rmd. Please edit that file -->

# EasyTidy

<!-- badges: start -->
<!-- badges: end -->

EasyTidy is a user-friendly R package designed to streamline data
tidying and transformation processes. It provides a collection of
functions to simplify common tasks related to data cleaning, reshaping,
and manipulation. EasyTidy leverages popular packages like dplyr and
tidy to offer an intuitive and efficient way to prepare and transform
datasets, reducing the complexity often associated with these
operations. It aims to simplify and accelerate the data preparation
phase, making it accessible to both beginners and experienced R users.

## Installation

You can install the development version of regexcite from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/EasyTidy")
```

## Usage

Currently EasyTidy only contain one function:

### tidy_column_with_delimiter_separated_values

The `tidy_column_with_delimiter_separated_values` function is used to
separate a column with delimiter-separated values into multiple rows and
pivot it into a wider format, indicating the presence of each value.
Here’s an example of how to use it:

``` r
library(EasyTidy)

# Create sample data
data <- data.frame(ID = 1:3, Codes = c("A,B,C", "D,E", "F,G,H,I"))

# Apply the function
result <- tidy_column_with_delimiter_separated_values(data, delimiter = ",", column = Codes)

# View the output
head(result)
#> # A tibble: 3 × 10
#>      ID Codes_A Codes_B Codes_C Codes_D Codes_E Codes_F Codes_G Codes_H Codes_I
#>   <int> <lgl>   <lgl>   <lgl>   <lgl>   <lgl>   <lgl>   <lgl>   <lgl>   <lgl>  
#> 1     1 TRUE    TRUE    TRUE    FALSE   FALSE   FALSE   FALSE   FALSE   FALSE  
#> 2     2 FALSE   FALSE   FALSE   TRUE    TRUE    FALSE   FALSE   FALSE   FALSE  
#> 3     3 FALSE   FALSE   FALSE   FALSE   FALSE   TRUE    TRUE    TRUE    TRUE
```

This function will take a data frame, a delimiter used to separate
values within the specified column, and the column name as arguments. It
separates the values by the delimiter and pivots the data into a wider
format where the columns represent the unique values found in the
original column.

Please ensure that the column specified exists in the data frame and is
of character type to avoid errors.
