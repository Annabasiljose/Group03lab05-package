test_that("checks if coordinates are correct", {
  expect_equal(get_country_coordinates("india"), c(68.1766451354,
            7.96553477623, 97.4025614766, 35.4940095078))
  expect_equal(get_country_coordinates("south.africa"), c(16.3449768409,
            -34.8191663551, 32.830120477, -22.0913127581))
})
