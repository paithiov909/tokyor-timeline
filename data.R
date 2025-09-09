dat <-
  readr::read_csv("data.csv") |>
  dplyr::mutate(
    content = stringi::stri_trans_nfkc(content) |>
      stringr::str_squish()
  ) |>
  dplyr::select(id, start, content, title, misc)

jsonlite::write_json(dat, "docs/data.json", pretty = TRUE)
