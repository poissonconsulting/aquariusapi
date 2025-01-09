test_that("aq_domain works", {
  expect_identical(aq_domain(), "evr.aquaticinformatics.net")
  expect_identical(aq_domain("poisson.aquaticinformatics.net"), "poisson.aquaticinformatics.net")
})
