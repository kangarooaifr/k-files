
# -- create data
data <- data.frame(id = 1,
                   comment = "test")

# setup
file <- "test.csv"
path <- "this/path/do/not/exist"
url <- file.path(path, file)

# -- test
test_that("returns FALSE when dir not exists & create is FALSE", {

  # -- function call
  x <- write_data(data = data, file = url, create = FALSE)

  # -- check
  expect_equal(x, FALSE)

  # -- function call
  x <- write_data(data = data, file = file, path = path, create = FALSE)

  # -- check
  expect_equal(x, FALSE)

})
