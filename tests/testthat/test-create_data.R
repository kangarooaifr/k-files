
test_that("colClassed = NA works", {
  foo <- create_data(colClasses = NA)
  expected <- data.frame()
  expect_equal(is.data.frame(foo), TRUE)
  expect_equal(foo, expected)
})

test_that("output is a data.frame", {
  foo <- create_data(colClasses = c("col" = "character"))
  expected <- data.frame(col = character(0))
  expect_equal(is.data.frame(foo), TRUE)
  expect_equal(foo, expected)
})
