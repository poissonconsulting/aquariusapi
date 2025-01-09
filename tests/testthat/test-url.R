test_that("aq_url works", {
  expect_identical(aq_url(), 
                   "https://evr.aquaticinformatics.net/AQUARIUS/Publish/v2")
  expect_identical(aq_url("poissonconsulting.aquaticinformatics.net"),
                   "https://poissonconsulting.aquaticinformatics.net/AQUARIUS/Publish/v2")
})
