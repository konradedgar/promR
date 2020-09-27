context("Metrics to xts conversion")

test_that("Function exists", {
  expect_true("metrics_to_xts" %in% ls(asNamespace("promR")))
})

test_that("Function fails on wrong input", {
  expect_error(metrics_to_xts(mtcars), regexp = ".*Must\\sbe\\sof\\stype.*")
  expect_error(metrics_to_xts(), regexp = ".*argument.*\\sis\\smissing.*")
  expect_error(metrics_to_xts(list(1, 2)), regexp = ".*Must\\shave\\snames\\.")
})

test_that("Range metrics is converted",{
  metr_xts_range <- metrics_to_xts(metricsRaw_range)
  expect_is(metr_xts_range, "xts")
  expect_gt(nrow(metr_xts_range), 2)
  expect_gt(ncol(metr_xts_range), 2)
})
