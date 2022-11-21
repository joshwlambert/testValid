data <- read.csv(
  file = system.file(
    "extdata",
    "test_database.csv",
    package = "testValid",
    mustWork = TRUE
  )
)

data$disease <- 4022

write.csv(
  x = data,
  file = "inst/extdata/test_database_diseease.csv",
  row.names = TRUE
)


# add more rows

data <- read.csv(
  file = system.file(
    "extdata",
    "test_database.csv",
    package = "testValid",
    mustWork = TRUE
  )
)

data <- rbind(
  data,
  c("ebola", "ebolavirus", "ebolavirus", "incubation", "Smith", 2005)
)

write.csv(
  x = data,
  file = "inst/extdata/test_database_rows.csv",
  row.names = FALSE
)


# add missing data

data <- read.csv(
  file = system.file(
    "extdata",
    "test_database.csv",
    package = "testValid",
    mustWork = TRUE
  )
)

data <- rbind(
  data,
  c(NA, "ebolavirus", "ebolavirus", "incubation", "Smith", 2005)
)

write.csv(
  x = data,
  file = "inst/extdata/test_database_missing.csv",
  row.names = FALSE
)

# extra field

data <- read.csv(
  file = system.file(
    "extdata",
    "test_database.csv",
    package = "testValid",
    mustWork = TRUE
  )
)

data <- rbind(
  data,
  c("ebola", "ebolavirus", "ebolavirus", "incubation", "Smith", 2005)
)
data <- cbind(data, data.frame(extrafield = c("hello", "world")))
write.csv(
  x = data,
  file = "inst/extdata/test_database_extrafield.csv",
  row.names = FALSE
)

