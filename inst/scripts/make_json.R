data <- read.csv(
  file = system.file(
    "extdata",
    "test_database_array.csv",
    package = "testValid",
    mustWork = TRUE
  ), header = TRUE
)
data$mean_ci <- lapply(strsplit(x = data$mean_ci, split = ","), as.numeric)


jsonlite::write_json(
  data,
  path = "inst/extdata/data.json",
  dataframe = "columns",
  na = "null",
  pretty = TRUE
)

schema <- yaml::read_yaml(
  system.file(
    "extdata",
    "schema.yaml",
    package = "testValid",
    mustWork = TRUE
  )
)

jsonlite::write_json(
  schema,
  path = "inst/extdata/schema.json",
  auto_unbox = TRUE,
  pretty = TRUE
)
