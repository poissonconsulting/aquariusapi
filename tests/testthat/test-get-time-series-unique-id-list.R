test_that("aq_get_time_series_unique_id_list() works", {
  data <- aq_get_time_series_unique_id_list()
  expect_snapshot_output(data)
})
