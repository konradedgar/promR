context("promMetric class instantiation + methods")

test_that("Class is created and inherits df methods", {
  smpl_promMetric_range <-
    promMetric(query = "String with query syntax...",
               query_type = "Range query",
               res_data = metrics_range_df)
  expect_s4_class(smpl_promMetric_range, class = "promMetric")
  expect_gt(nrow(smpl_promMetric_range), 10)
  expect_named(smpl_promMetric_range)
  expect_gt(ncol(smpl_promMetric_range), 3)
})
