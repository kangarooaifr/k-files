

test_that("Missing file & create FALSE returns empty dataframe", {

  # -- function call
  x <- read_data(file = "this/path/do/not/exist/test.csv", path = NULL, colClasses = NA, create = FALSE)

  # -- check
  expect_equal(x , data.frame())

  # -- function call
  x <- read_data(file = "test.csv", path = "this/path/do/not/exist", colClasses = NA, create = FALSE)

  # -- check
  expect_equal(x, data.frame())

})



