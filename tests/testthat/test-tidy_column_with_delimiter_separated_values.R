test_that("Testing tidy_column_with_delimiter_seperated_values function", {
  # Test 1: Vector with no NAs
  df_no_na <- data.frame(ID = 1:3, Amenities = c("Wifi,Pool,Gym", "Parking,Wifi", "Gym,Spa"))
  output_no_na <- tidy_column_with_delimiter_separated_values(df_no_na, ",", Amenities)
  expect_true(all(c("Amenities_Wifi", "Amenities_Pool", "Amenities_Gym") %in% colnames(output_no_na)))
  expect_equal(ncol(output_no_na), 6)

  # Test 2: Vector that has NAs
  df_with_na <- data.frame(ID = 1:4, Amenities = c("Wifi,Pool,Gym", NA, "Parking,Wifi", "Gym,Spa"))
  output_with_na <- tidy_column_with_delimiter_separated_values(df_with_na, ",", Amenities)
  expect_true(all(c("Amenities_Wifi", "Amenities_Pool", "Amenities_NA") %in% colnames(output_with_na)))
  expect_identical(nrow(output_with_na), nrow(df_with_na))

  # Test 3: Vector of length 0
  df_empty <- data.frame(ID = numeric(0), Amenities = character(0))
  output_empty <- tidy_column_with_delimiter_separated_values(df_empty, ",", Amenities)
  expect_equal(nrow(output_empty), 0)

  # Test 4: Test for passing a non-existence column to the function, should return Error
  df_nonexistent_column <- data.frame(ID = 1:3, Features = c("Forest,Lake", "Lake,Pool", "Gym,Spa"))
  expect_error(tidy_column_with_delimiter_separated_values(df_nonexistent_column, ",", Nonexistent_Column))

})
