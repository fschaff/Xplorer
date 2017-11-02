
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
library("Xplorer")

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

If you are not working in Rstudio, `View()` may not work in the same way and may not offer a search option. Hence `browse()` does not call `View()` directly. Instead, store the data in a new object first, which then can be opened with `View()` in Rstudio. `browse()` can also be called on a data.frame directly to print the output to the console.

#### Example

``` r
library("Xplorer")

# Create an example data.frame and add some variable labels
data(mtcars)
attributes(mtcars$mpg)$label <- "Miles/(US) gallon"
attributes(mtcars$disp)$label <- "Displacement (cu.in.)"
attributes(mtcars$drat)$label <- "Rear axle ratio"

# Call browse() directly...
browse(mtcars)
#>    variable.name        variable.label        range distinct.values
#> 1            mpg     Miles/(US) gallon   10.4, 33.9              25
#> 2            cyl                     -         4, 8               3
#> 3           disp Displacement (cu.in.)  71.1, 472.0              27
#> 4             hp                     -      52, 335              22
#> 5           drat       Rear axle ratio   2.76, 4.93              22
#> 6             wt                     - 1.513, 5.424              29
#> 7           qsec                     -   14.5, 22.9              30
#> 8             vs                     -         0, 1               2
#> 9             am                     -         0, 1               2
#> 10          gear                     -         3, 5               3
#> 11          carb                     -         1, 8               6
#>      class typeof  N missings
#> 1  numeric double 32        0
#> 2  numeric double 32        0
#> 3  numeric double 32        0
#> 4  numeric double 32        0
#> 5  numeric double 32        0
#> 6  numeric double 32        0
#> 7  numeric double 32        0
#> 8  numeric double 32        0
#> 9  numeric double 32        0
#> 10 numeric double 32        0
#> 11 numeric double 32        0

# ...or assign to df and open with View()
df <- browse(mtcars)
```

Then use `View(df)` and use the search field to search variable names and labels.

Installation
------------

You can install Xplorer from CRAN with:

``` r
install.packages("Xplorer")
```

Or install the development version from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("fschaff/Xplorer")
```

Please report issues or requests for additional functionality to <https://github.com/fschaff/Xplorer/issues>.
