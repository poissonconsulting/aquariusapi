test_that("aq_get_location_data works", {
  expect_snapshot_output(aq_get_location_data("LC_DRY_WQ06_TEMP"))
})
