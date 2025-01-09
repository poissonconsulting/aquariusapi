test_that("aq_get_auth_token works", {
  expect_true(chk::vld_string(aq_get_auth_token()))
  expect_true(chk::vld_string(aq_token()))
})
