# Now, we can see what the most popular air route is, by summing up the number of
# passengers carried.
#' @export
busiest_routes = function (dataframe, origcol, destcol) {
  stopifnot(all(dataframe$Passengers >= 1))
  stopifnot(!any(is.na(dataframe$Passengers)))

  pairs = dataframe |>
    group_by({{ origcol }}, {{ destcol }}) |>
    summarize(Passengers = sum(Passengers), distance_km = first(Distance) * MILES_TO_KILOMETERS)
  arrange(pairs, -Passengers)

  # we see that LAX-JFK (Los Angeles to New York Kennedy) is represented separately
  # from JFK-LAX. We'd like to combine these two. Create airport1 and airport2 fields
  # with the first and second airport in alphabetical order.
  pairs = pairs |>
    mutate(
      airport1 = if_else({{ origcol }} < {{ destcol }}, {{ origcol }}, {{ destcol }}),
      airport2 = if_else({{ origcol }} < {{ destcol }}, {{ destcol }}, {{ origcol }})
    ) |>
    group_by(airport1, airport2) |>
    summarize(Passengers = sum(Passengers), distance_km = first(distance_km)) |>
    ungroup()

  arrange(pairs, -Passengers)
}
