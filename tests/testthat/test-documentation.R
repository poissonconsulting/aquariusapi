test_that("aq_documentation works", {
  expect_identical(
    aq_documentation("GetAuthTokenServiceRequest"),
    "https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2/json/metadata?op=GetAuthTokenServiceRequest"
  )
})
