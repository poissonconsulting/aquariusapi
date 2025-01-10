test_that("aq_get_time_series_description_list works", {
  expect_snapshot(aq_get_time_series_description_list())
})

test_that("aq_get_time_series_description_list parameter", {
  expect_snapshot(aq_get_time_series_description_list(parameter = "Water Temperature"))
})

test_that("aq_get_time_series_description_list works location_identifier", {
  expect_snapshot(aq_get_time_series_description_list("LC_DRY_WQ06_TEMP"))
})


test_that("aq_get_time_series_description_list works no rows", {
  expect_snapshot(aq_get_time_series_description_list("LC_DRY_WQ06_TEMP", parameter = "Discharge"))
})
