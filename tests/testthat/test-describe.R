test_that("describe() works", {



  # describe numeric

  vec_num <- c(NA, 1:4)

  na_rm <- TRUE
  test_res <- c(min(vec_num, na.rm = na_rm),
                stats::median(vec_num, na.rm = na_rm),
                max(vec_num, na.rm = na_rm),
                mean(vec_num, na.rm = na_rm),
                stats::sd(vec_num, na.rm = na_rm),
                length(vec_num),
                sum(is.na(vec_num)))
  res <- datafairy::describe(vec_num, na.rm = na_rm)
  expect_equal(res$Value, test_res,
               tolerance = 0.015)

  na_rm <- FALSE
  test_res <- c(min(vec_num, na.rm = na_rm),
                stats::median(vec_num, na.rm = na_rm),
                max(vec_num, na.rm = na_rm),
                mean(vec_num, na.rm = na_rm),
                stats::sd(vec_num, na.rm = na_rm),
                length(vec_num),
                sum(is.na(vec_num)))
  res <- datafairy::describe(vec_num, na.rm = na_rm)
  expect_equal(res$Value, test_res,
               tolerance = 0.015)
})
