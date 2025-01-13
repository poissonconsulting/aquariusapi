test_that("aq_get_time_series_description_list_by_unique_id works", {
  expect_snapshot(aq_get_time_series_description_list_by_unique_id("27a6b0badd044e0c9b29d589b9e078d9"))
})

test_that("aq_get_time_series_description_list_by_unique_id works vector", {
  expect_snapshot(aq_get_time_series_description_list_by_unique_id(c("27a6b0badd044e0c9b29d589b9e078d9", "11e69f80f4d6474e8f9c07b10b2b83d7")))
})

test_that("aq_get_time_series_description_list_by_unique_id informative error no vector", {
  expect_error(aq_get_time_series_description_list_by_unique_id(character()), "must have a length")
})

test_that("aq_get_time_series_description_list_by_unique_id eliminates duplicates", {
  expect_snapshot(aq_get_time_series_description_list_by_unique_id(c("27a6b0badd044e0c9b29d589b9e078d9", "27a6b0badd044e0c9b29d589b9e078d9")))
})
