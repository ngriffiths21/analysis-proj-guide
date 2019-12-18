test_that("`ex_std_error` gets correct result", {
  expect_equal(round(ex_std_error(c(1, 2, 3)), 3), 0.577)
})

test_that("mtcars has correct # of rows", {
  expect_equal(nrow(better_mtcars), 32)
})
