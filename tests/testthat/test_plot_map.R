test_that("checks if coordinates are correct", {
  expect_equal(get_country_coordinates("india"), c(68.1766451354,
            7.96553477623, 97.4025614766, 35.4940095078))
  expect_equal(get_country_coordinates("south.africa"), c(16.3449768409,
            -34.8191663551, 32.830120477, -22.0913127581))
})

test_that("checks if error is thrown for inputs other than country names", {
  expect_error(get_country_coordinates("hej"))
  expect_error(get_country_coordinates(12345))
})

test_that("checks if the country names returned are correct", {
  expect_equal(names(get_country_names())[5], "argentina")
  expect_equal(names(get_country_names())[100], "madagascar")
})

test_that("check the inputs of api calling function", {
  expect_error(req_stamen_map(68.1766451354, 7.96553477623,
                              97.4025614766, 35.4940095078, 10, "terrain"))
  expect_error(req_stamen_map(68.1766451354, 7.96553477623,
                              97.4025614766, 35.4940095078, 4, "satelite"))
  expect_s3_class(req_stamen_map(68.1766451354, 7.96553477623,
                              97.4025614766, 35.4940095078, 4, "terrain") ,
                              "ggplot")
  expect_s3_class(req_stamen_map(16.3449768409, -34.8191663551,
                              32.830120477, -22.0913127581, 5, "watercolor") ,
                              "ggplot")
})

