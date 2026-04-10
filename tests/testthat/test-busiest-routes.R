test_that("busiest routes returns correct route", {
  file = system.file("testdata/passengers.csv", package="OdumModularDesignR")

  data = readr::read_csv(file)
  result = busiest_routes(data, from, to)

  expect_equal(result, tibble::tribble(
    ~airport1, ~airport2, ~Passengers, ~distance_km,
    "JFK",      "SFO",        4,          2586 * 1.609,
    "CLT",      "RDU",        3,          130 * 1.609
  ))
})
