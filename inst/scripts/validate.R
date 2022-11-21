data <- read.csv(
  file = system.file(
    "extdata",
    "test_database_missing.csv",
    package = "testValid",
    mustWork = TRUE
  ), header = TRUE
)

data_json <- jsonlite::toJSON(data, dataframe = "columns", na = "null")

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

jsonvalidate::json_validate(
  json = data_json,
  schema = schema_json,
  engine = "ajv",
  verbose = TRUE,
  greedy = TRUE,
  strict = TRUE
)
