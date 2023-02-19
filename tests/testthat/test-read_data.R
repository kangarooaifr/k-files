

test_that("Missing file & create FALSE returns empty dataframe", {

  expect_equal(read_data(file = "this/path/do/not/exist/test.csv", path = NULL, colClasses = NA, create = FALSE), data.frame())
  expect_equal(read_data(file = "test.csv", path = "this/path/do/not/exist", colClasses = NA, create = FALSE), data.frame())

})



