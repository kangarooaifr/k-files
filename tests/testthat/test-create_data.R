

test_that("create_data with colClasse = NA works", {

  # -- function call
  x <- create_data(colClasses = NA)

  # -- check if output is a data.frame
  expect_true(is.data.frame(x))

  # -- check output
  expect_equal(x, data.frame())

})


test_that("create_data works", {

  # -- function call
  x <- create_data(colClasses = c("col" = "character"))

  # -- check if output is a data.frame
  expect_true(is.data.frame(x))

  # -- check output
  expect_equal(x, data.frame(col = character(0)))

})
