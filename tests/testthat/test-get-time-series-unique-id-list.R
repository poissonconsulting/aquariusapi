test_that("aq_get_time_series_unique_id_list() works", {
  expect_snapshot_output(aq_get_time_series_unique_id_list())
})

test_that("aq_get_time_series_unique_id_list() LC_DRY_WQ06_TEMP", {
  expect_snapshot_output(aq_get_time_series_unique_id_list("LC_DRY_WQ06_TEMP"))
})

test_that("aq_get_time_series_unique_id_list() water_temperature", {
  expect_snapshot_output(aq_get_time_series_unique_id_list(parameter = "Water Temperature"))
})

test_that("aq_get_time_series_unique_id_list() LC_DRY_WQ06_TEMP water temperature", {
  expect_snapshot_output(aq_get_time_series_unique_id_list("LC_DRY_WQ06_TEMP", parameter = "Water Temperature"))
})

test_that("aq_get_time_series_unique_id_list() no rows", {
  expect_snapshot_output(aq_get_time_series_unique_id_list("LC_DRY_WQ06_TEMP", parameter = "Discharge"))
})
