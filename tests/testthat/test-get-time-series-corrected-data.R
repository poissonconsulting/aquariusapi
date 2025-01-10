test_that("aq_get_time_series_corrected_data works", {
  expect_snapshot_output(aq_get_time_series_corrected_data("27a6b0badd044e0c9b29d589b9e078d9"))
})

test_that("aq_get_time_series_corrected_data query_from", {
  expect_snapshot_output(aq_get_time_series_corrected_data("27a6b0badd044e0c9b29d589b9e078d9",
                         query_from = as.Date("2022-01-17"),
                         query_to = as.Date("2022-02-17")))
})

test_that("aq_get_time_series_corrected_data query_from out", {
  expect_snapshot_output(aq_get_time_series_corrected_data("27a6b0badd044e0c9b29d589b9e078d9",
                                                           query_from = as.Date("1950-01-17"),
                                                           query_to = as.Date("1950-02-17")))
})
