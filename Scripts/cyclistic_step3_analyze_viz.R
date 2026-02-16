library(dplyr)
library(lubridate)
library(ggplot2)
library(readr)
library(scales)

processed_file <- "/Users/artem/Desktop/Cyclistic_Analysis/Processed_Data/clean_sample_2025_2026.csv"
trips <- read_csv(processed_file, show_col_types = FALSE)

trips <- trips %>%
  mutate(
    day_of_week = factor(
      day_of_week,
      levels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"),
      ordered = TRUE
    )
  )


cat("Loaded rows:", nrow(trips), "\n")
cat("User type distribution (%):\n")
print(round(prop.table(table(trips$member_casual)) * 100, 1))

stats_summary <- trips %>%
  group_by(member_casual) %>%
  summarise(
    ride_count         = n(),
    avg_duration_min   = mean(ride_length_minutes),
    median_duration    = median(ride_length_minutes),
    max_duration       = max(ride_length_minutes),
    p95_duration       = quantile(ride_length_minutes, 0.95)
  ) %>%
  mutate(across(where(is.numeric), ~round(., 2)))

cat("\nKey statistics by user type:\n")
print(stats_summary)

rides_by_day <- trips %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    ride_count     = n(),
    avg_duration   = mean(ride_length_minutes),
    .groups        = "drop"
  )

p1 <- ggplot(rides_by_day, aes(x = day_of_week, y = ride_count, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("casual" = "#FF7F0E", "member" = "#1F77B4")) +
  labs(
    title    = "Number of Rides by Day of Week (Casual vs Member)",
    x        = "Day of Week",
    y        = "Number of Rides",
    fill     = "User Type"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "top")

ggsave("/Users/artem/Desktop/Cyclistic_Analysis/Visuals/rides_by_day_of_week.png", 
       p1, width = 10, height = 6, dpi = 150)

p2 <- ggplot(rides_by_day, aes(x = day_of_week, y = avg_duration, color = member_casual, group = member_casual)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  scale_color_manual(values = c("casual" = "#FF7F0E", "member" = "#1F77B4")) +
  labs(
    title    = "Average Ride Duration by Day of Week",
    x        = "Day of Week",
    y        = "Average Duration (minutes)",
    color    = "User Type"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "top")

ggsave("/Users/artem/Desktop/Cyclistic_Analysis/Visuals/avg_duration_by_day_of_week.png", 
       p2, width = 10, height = 6, dpi = 150)

rides_by_hour <- trips %>%
  group_by(member_casual, hour_of_day) %>%
  summarise(ride_count = n(), .groups = "drop")

p3 <- ggplot(rides_by_hour, aes(x = hour_of_day, y = ride_count, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("casual" = "#FF7F0E", "member" = "#1F77B4")) +
  scale_x_continuous(breaks = seq(0, 23, by = 2)) +
  labs(
    title    = "Number of Rides by Hour of Day",
    x        = "Hour of Day (0–23)",
    y        = "Number of Rides",
    fill     = "User Type"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "top")

ggsave("/Users/artem/Desktop/Cyclistic_Analysis/Visuals/rides_by_hour_of_day.png", 
       p3, width = 10, height = 6, dpi = 150)

cat("\nГрафики обновлены и сохранены в папке Visuals/\n")
