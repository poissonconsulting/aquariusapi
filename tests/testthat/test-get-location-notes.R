test_that("aq_get_location_notes works", {
  expect_snapshot_output(aq_get_location_notes("LC_DRY_WQ06_TEMP"))
})
