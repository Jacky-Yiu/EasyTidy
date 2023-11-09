#' Tidy Column with Delimiter-Separated Values
#'
#' This function separates a column with delimiter-separated values into multiple rows and pivots it to wide format, indicating the presence of each value.
#'
#' @param data A tibble/data frame containing the column to be tidied.
#' @param delimiter The delimiter used to separate values within the column.
#' @param column The name of the column that contains delimiter-separated values.
#' @return A modified tibble/data frame where the specified column has been separated into multiple rows and pivoted to a wider format, showing the presence of each 'value.'
#' @examples
#' example <- data.frame(ID = 1:3, Codes = c("A,B,C", "D,E", "F,G,H,I"))
#' tidy_column_with_delimiter_separated_values(example, delimiter = ",", column = Codes)
#' @export
tidy_column_with_delimiter_separated_values <- function(data, delimiter, column) {
  col_name <- deparse(substitute(column))
  stopifnot(col_name %in% colnames(data))
  stopifnot(is.character(data[[col_name]]))

  data |>
    tidyr::separate_rows({{ column }}, sep = delimiter) |>
    dplyr::mutate(value = TRUE) |>
    tidyr::pivot_wider(names_from = {{ column }},
                values_from = value,
                values_fill =  FALSE,
                names_prefix = paste0(col_name , "_"))
}
