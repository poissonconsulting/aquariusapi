test_that("aq_get_time_series_unique_id_list works", {
  data <- aq_get_time_series_unique_id_list()
  expect_s3_class(
    chk::check_data(data,
               list(UniqueId = ""),
               exclusive = TRUE,
               order = TRUE,
               nrow = TRUE,
               key = "UniqueId"
              ), "tbl")
  expect_snapshot_output(data)
})
