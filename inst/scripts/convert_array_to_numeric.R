data <- read.csv(
  file = system.file(
    "extdata",
    "test_database_array.csv",
    package = "testValid",
    mustWork = TRUE
  ), header = TRUE
)
data$mean_ci <- lapply(strsplit(x = data$mean_ci, split = ","), as.numeric)

