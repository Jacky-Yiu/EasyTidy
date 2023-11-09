tidy_column_with_delimiter_seperated_values <- function(data, delimiter, column) {
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
