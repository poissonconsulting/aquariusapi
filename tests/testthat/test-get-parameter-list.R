test_that("aq_get_parameter_list works", {
  data <- aq_get_parameter_list()
  expect_snapshot_output(data)
})
