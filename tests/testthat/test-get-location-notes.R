test_that("aq_get_location_notes works", {
  data <- aq_get_location_notes("LC_DRY_WQ06_TEMP")
  expect_snapshot_output(data)
})
