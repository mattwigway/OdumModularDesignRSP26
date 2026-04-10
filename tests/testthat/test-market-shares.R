get_data = function () {
  tibble::tibble(
    Origin=rep(c("SFO", "ORD", "DCA", "PHX", "BOS", "RDU"), 20),
    Destination=rep(c("DFW", "MCI", "MIA", "ABQ", "IAH", "SJU"), 20),
    Passengers=rep(1:6, 20),
    Carrier=rep(c("United", "American", "Delta", "Southwest"), 30)
  )
}

test_that("market shares sum to 1", {
  data = get_data()
  result = market_shares(data, Carrier, Origin)

  by_origin = result |>
    group_by(Origin) |>
    summarize(market_share = sum(market_share))

  expect_all_equal(by_origin$market_share, 1)
  expect_equal(nrow(by_origin), 6)
})

test_that("market shares fails with no passenger column", {
  data = get_data() |>
    dplyr::select(-Passengers)

  expect_error({ market_shares(data, Carrier, Origin) }, regexp = "Passengers")
})
