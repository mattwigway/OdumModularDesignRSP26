# Compute market shares in an airport or city

Compute market shares by airport or by city, with flexibility to specify
how the carrier is defined.

## Usage

``` r
market_shares(dataframe, carrier, orig)
```

## Arguments

- dataframe:

  Data to base the market shares on; should have a Passengers column

- carrier:

  Column name containing the carrier for each ticket, unquoted

- orig:

  Column name containing the origin city or airport, unquoted

## Value

a dataframe with the carrier and orig columns, and a market_share column
that contains the market share of that carrier in that location, as a
proportion.

## Details

This will calculate market shares and return them as proportions by
airport or city and by operator.

## Examples

``` r
data = tibble::tribble(
  ~origin, ~airline, ~Passengers,
  "CLT",    "American", 10,
  "CLT",    "United",  5,
  "RDU",    "American", 5,
  "RDU",    "United", 7
)

market_shares(data, airline, carrier)
#> Error in group_by(dataframe, {    {        carrier    }}, {    {        orig    }}): Must group by variables found in `.data`.
#> ✖ Column `carrier` is not found.
```
