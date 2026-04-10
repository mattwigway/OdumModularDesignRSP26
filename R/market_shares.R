#' Compute market shares in an airport or city
#'
#' Compute market shares by airport or by city, with flexibility to specify how
#' the carrier is defined.
#'
#' This will calculate market shares and return them as proportions by airport
#' or city and by operator.
#'
#' @param dataframe Data to base the market shares on; should have a Passengers
#'   column
#' @param carrier Column name containing the carrier for each ticket, unquoted
#' @param orig Column name containing the origin city or airport, unquoted
#'
#' @returns a dataframe with the carrier and orig columns, and a market_share
#'   column that contains the market share of that carrier in that location,
#'   as a proportion.
#'
#' @examplesIf require("tibble")
#' data = tibble::tribble(
#'   ~origin, ~airline, ~Passengers,
#'   "CLT",    "American", 10,
#'   "CLT",    "United",  5,
#'   "RDU",    "American", 5,
#'   "RDU",    "United", 7
#' )
#'
#' market_shares(data, airline, carrier)
#' @export
market_shares = function (dataframe, carrier, orig) {
  mkt_shares = dataframe |>
    group_by({{ carrier }}, {{ orig }}) |>
    summarize(Passengers = sum(Passengers)) |>
    group_by({{ orig }}) |>
    mutate(market_share = Passengers / sum(Passengers), total_passengers = sum(Passengers)) |>
    ungroup()

  arrange(mkt_shares, -market_share)
}
