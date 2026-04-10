market_shares = function (dataframe, carrier, orig) {
  mkt_shares = dataframe |>
    group_by({{ carrier }}, {{ orig }}) |>
    summarize(Passengers = sum(Passengers)) |>
    group_by({{ orig }}) |>
    mutate(market_share = Passengers / sum(Passengers), total_passengers = sum(Passengers)) |>
    ungroup()

  arrange(mkt_shares, -market_share)
}
