test_that("aq_get_location_data works", {
  data <- aq_get_location_data("LC_DRY_WQ06_TEMP")
  expect_snapshot_output(data)
})
