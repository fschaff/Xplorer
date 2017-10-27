
<!-- README.md is generated from README.Rmd. Please edit that file -->
Xplorer: Convenient Data Exploration with see() and browse()
============================================================

Xplorer provides two simple functions to facilitate the exploration of datasets in R, [`see()`](#see) and [`browse()`](#browse).

see()
-----

`see()` prints the following details of an object to the console:

-   attributes (useful to inspect labels)
-   class, typeof, mode, storage.mode
-   table (frequency and percentage of values)
-   summary statistics

There are several other packages which attempt to do someting similar, but none of them offers the ease of use and thourough inspection of ojects. For example, base R offers the functions `summary()`, `str()` and `structure()`. However, each of those is limited in what they display and leave other aspects untouched. `see()` combines a number of functions that would have to be invoked seperately and mirrors Stata's 'codebook'.

`see()`is an S3 generic and currently comes with the following data types:

-   character
-   factor
-   numeric
-   data.frame
-   labelled
-   default (all other types)

#### Example

``` r
library(Xplorer)

# Create example data
numeric.labelled <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
attributes(numeric.labelled)$label <- "mylabel"

# see the object
see(numeric.labelled)
#> $label
#> [1] "mylabel"
#> 
#> 
#> 
#>    Class Typeof    Mode Storage.mode
#>  numeric double numeric       double
#> 
#> 
#>   Frequency Percent
#> 1         1      10
#> 2         2      20
#> 3         3      30
#> 4         4      40
#> 
#> 
#>   N Missings Distinct.values Min Max Mean Median Std.Deviation Variance
#>  10        0               4   1   4    3      3      1.054093 1.111111
```

browse()
--------

The aim of `browse()` is to create a data.frame that allows you to use the search field in the Rstudio `View()` function to search for variables based on their names or values, which is currently not possible. In particular if a dataset is very large and no comprehensive codebook is available, quickly searching for variable names makes finding variables of interest much easier.

If you are not working in Rstudio, `View()` may not work in the same way and may not offer a search option. Hence `browse()` does not call `View()` directly. Instead, store the data in a new object first, which then can be opened with `View()` in Rstudio.

#### Example

``` r
library("Xplorer")

# create an example data.frame and add some variable labels
data(mtcars)
attributes(mtcars$mpg)$label <- "Miles/(US) gallon"
attributes(mtcars$disp)$label <- "Displacement (cu.in.)"
attributes(mtcars$drat)$label <- "Rear axle ratio"
df <- browse(mtcars)
```

Then use `View(df)` and use the search field to search variable names and labels.

Installation
------------

You can install Xplorer from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("fschaff/Xplorer")
```
