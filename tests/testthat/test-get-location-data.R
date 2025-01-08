test_that("tables works", {
  location_data <- aq_get_location_data("LC_DRY_WQ06_TEMP")
  expect_snapshot_output(location_data)
})
