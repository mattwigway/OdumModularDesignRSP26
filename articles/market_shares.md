# Market share

``` r
library(OdumModularDesignR)
```

In this vignette, we will discuss calculating market shares. First we
need to load some data.

``` r
file = system.file("testdata/passengers.csv", package="OdumModularDesignR")
data = read.csv(file)
```

Next we can calculate market shares:

``` r
busiest_routes(data, from, to)
#> # A tibble: 2 × 4
#>   airport1 airport2 Passengers distance_km
#>   <chr>    <chr>         <int>       <dbl>
#> 1 JFK      SFO               4       4161.
#> 2 CLT      RDU               3        209.
```
