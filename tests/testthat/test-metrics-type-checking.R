context("Utils: getting metrics type")

test_that("Fails on wrong object type", {
  expect_error(metrics_type_check(mtcars))
  expect_error(metrics_type_check(1))
  expect_error(metrics_type_check(NULL))
  expect_error(metrics_type_check(list(1)))
})

test_that("Correct type is returned", {
  expect_identical(metrics_type_check(metricsRaw_range), "range")
  expect_identical(metrics_type_check(metricsRaw_instant), "instant")
})
