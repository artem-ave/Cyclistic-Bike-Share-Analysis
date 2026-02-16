raw_path <- "/Users/artem/Desktop/Cyclistic_Analysis/Raw_Data/"

csv_files <- list.files(raw_path, pattern = "\\.csv$", full.names = TRUE)

print(length(csv_files))
print(csv_files)

test_file <- csv_files[1]
test_data <- read_csv(test_file, n_max = 1000)

glimpse(test_data)
head(test_data)


