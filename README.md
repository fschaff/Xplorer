
<!-- README.md is generated from README.Rmd. Please edit that file -->
Xplorer
=======

The goal of Xplorer is to provide a more convenient way for data exploration than existing packages.

Installation
------------

You can install Xplorer from github with:

``` r
# install.packages("devtools")
devtools::install_github("fschaff/Xplorer")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
# load package
library(Xplorer)

# see an object
see(mtcars$mpg)
#>                                         
#>  No attributes stored for this variable.
#> 
#> 
#>    Class Typeof    Mode Storage.mode
#>  numeric double numeric       double
#> 
#> 
#>      Frequency Percent
#> 10.4         2    6.25
#> 13.3         1    3.12
#> 14.3         1    3.12
#> 14.7         1    3.12
#> 15           1    3.12
#> 15.2         2    6.25
#> 15.5         1    3.12
#> 15.8         1    3.12
#> 16.4         1    3.12
#> 17.3         1    3.12
#> 17.8         1    3.12
#> 18.1         1    3.12
#> 18.7         1    3.12
#> 19.2         2    6.25
#> 19.7         1    3.12
#> 21           2    6.25
#> 21.4         2    6.25
#> 21.5         1    3.12
#> 22.8         2    6.25
#> 24.4         1    3.12
#> 26           1    3.12
#> 27.3         1    3.12
#> 30.4         2    6.25
#> 32.4         1    3.12
#> 33.9         1    3.12
#> 
#> 
#>   N Missings Distinct.values  Min  Max Median     Mean Std.Deviation
#>  32        0              25 10.4 33.9   19.2 20.09062      6.026948
#>  Variance
#>   36.3241
```
