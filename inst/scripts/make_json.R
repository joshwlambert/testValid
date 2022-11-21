data <- read.csv(
  file = system.file(
    "extdata",
    "test_database_array.csv",
    package = "testValid",
    mustWork = TRUE
  ), header = TRUE
)
data$mean_ci <- lapply(strsplit(x = data$mean_ci, split = ","), as.numeric)

data_json <- jsonlite::toJSON(data, dataframe = "columns", na = "null")

jsonlite::write_json(data_json, path = "inst/extdata/data.json")

schema <- yaml::read_yaml(
  system.file(
    "extdata",
    "schema.yaml",
    package = "testValid",
    mustWork = TRUE
  )
)
schema_json <- jsonlite::toJSON(schema, auto_unbox = TRUE)
jsonlite::validate(schema_json)

jsonlite::write_json(schema_json, path = "inst/extdata/schema.json")
