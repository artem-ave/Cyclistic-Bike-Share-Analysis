# ────────────────────────────────────────────────────────────────
# ШАГ 2: Сэмплирование, добавление колонок, базовая чистка
# ────────────────────────────────────────────────────────────────

library(dplyr)
library(lubridate)
library(readr)

raw_path <- "/Users/artem/Desktop/Cyclistic_Analysis/Raw_Data/"

csv_files <- list.files(raw_path, pattern = "\\.csv$", full.names = TRUE)

cat("Найдено файлов:", length(csv_files), "\n")
if (length(csv_files) == 0) stop("Нет файлов в Raw_Data!")

# Функция для обработки одного файла
process_one_file <- function(file_path, sample_fraction = 0.075) {
  
  cat("Обрабатываю:", basename(file_path), "\n")
  
  # Читаем файл
  data <- read_csv(file_path, show_col_types = FALSE)
  
  # Сэмплируем ~7.5% строк (можно изменить на 0.05 или 0.1)
  sampled <- data %>% slice_sample(prop = sample_fraction)
  
  # Добавляем нужные колонки
  sampled <- sampled %>%
    mutate(
      started_at = ymd_hms(started_at),
      ended_at   = ymd_hms(ended_at),
      ride_length_minutes = as.numeric(difftime(ended_at, started_at, units = "mins")),
      day_of_week         = wday(started_at, label = TRUE, abbr = TRUE),  # Sun, Mon...
      hour_of_day         = hour(started_at)
    )
  
  # Базовая чистка
  cleaned <- sampled %>%
    filter(
      !is.na(ride_length_minutes),
      ride_length_minutes >= 1,               # минимум 1 минута
      ride_length_minutes <= 1440,            # максимум 24 часа
      !is.na(member_casual),
      member_casual %in% c("member", "casual")
    )
  
  return(cleaned)
}

# Применяем функцию ко всем файлам и объединяем
all_sampled <- lapply(csv_files, process_one_file) %>% 
  bind_rows()

# Финальная проверка
cat("\nОбъединено строк после сэмплирования и чистки:", nrow(all_sampled), "\n")
cat("Распределение по типам пользователей:\n")
table(all_sampled$member_casual)

# Сохраняем результат
processed_path <- "/Users/artem/Desktop/Cyclistic_Analysis/Processed_Data/"
if (!dir.exists(processed_path)) dir.create(processed_path)

write_csv(all_sampled, 
          file = paste0(processed_path, "clean_sample_2025_2026.csv"))

cat("\nФайл сохранён:", paste0(processed_path, "clean_sample_2025_2026.csv"), "\n")
cat("Размер датасета:", round(object.size(all_sampled) / 1024^2, 1), "MB\n")