test_that("aq_get_time_series_data_raw works", {
  data <- aq_get_time_series_data_raw("27a6b0badd044e0c9b29d589b9e078d9")
  expect_snapshot_output(data)
})
