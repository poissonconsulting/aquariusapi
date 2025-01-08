test_that("aq_get_unit_list works", {
  data <- aq_get_unit_list()
  expect_snapshot_output(data)
})
