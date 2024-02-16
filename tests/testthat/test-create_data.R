

test_that("create_data with colClasse = NA works", {

  # -- function call
  x <- create_data(colClasses = NA)

  # -- check if output is a data.frame
  expect_true(is.data.frame(x))

  # -- check output
  expect_equal(x, data.frame())

})


test_that("create_data works with one col", {

  # -- function call
  x <- create_data(colClasses = c("col" = "character"))

  # -- check if output is a data.frame
  expect_true(is.data.frame(x))

  # -- check output
  expect_equal(x, data.frame(col = character(0)))

})


test_that("create_data works with several cols", {

  # -- function call
  x <- create_data(colClasses = c("col" = "character", "col_2" = "numeric"))

  # -- check if output is a data.frame
  expect_true(is.data.frame(x))

  # -- check output
  expect_equal(x, data.frame(col = character(0), col_2 = numeric(0)))

})
