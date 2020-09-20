context("Metrics to xts conversion")

test_that("Function exists", {
  expect_true("metrics_to_xts" %in% ls(asNamespace("promR")))
})

test_that("Function fails on wrong input", {
  expect_error(metrics_to_xts(mtcars), regexp = ".*Must\\sbe\\sof\\stype.*")
  expect_error(metrics_to_xts(), regexp = ".*argument.*\\sis\\smissing.*")
  expect_error(metrics_to_xts(list(1, 2)), regexp = ".*Must\\shave\\snames\\.")
})
