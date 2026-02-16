# Cyclistic Bike-Share Case Study – Google Data Analytics Capstone

## Business Task
The director of marketing believes the company’s future success depends on maximizing annual memberships.  
The task is to analyze historical trip data to understand how **annual members** and **casual riders** use Cyclistic bikes differently — and provide actionable insights to convert casual riders into members.

## Data Source
- Public Divvy trip data (Lyft Bikes and Scooters, LLC)  
- Period: February 2025 – January 2026 (13 monthly CSV files)  
- Original size: ~5–6 million rows  
- Analysis performed on ~7.5% random sample (~415,000 rides) for computational efficiency  
- Key columns used: ride_id, started_at, ended_at, member_casual, rideable_type, etc.  
- Privacy: No personally identifiable information (PII) — GDPR-compliant approach  
- Source link: https://divvy-tripdata.s3.amazonaws.com/

## Methodology & Tools
- **Data processing**: Random sampling, cleaning (remove invalid durations), feature engineering (ride_length_minutes, day_of_week, hour_of_day)  
- **Tools**: R (dplyr, lubridate, ggplot2, readr) in RStudio Desktop  
- **Scripts**:
  1. Load & initial sampling
  2. Cleaning & feature creation
  3. Descriptive analysis & visualizations

## Key Findings

- **User distribution**: 65% annual members, 35% casual riders
- **Ride duration**:
  - Casual riders: average **19.7 minutes** (median 11.8 min)
  - Annual members: average **12.2 minutes** (median 8.7 min)
- **Patterns by day of week** (Monday–Sunday):
  - Casual riders take longer rides on weekends (peak ~22 min on Sunday), shorter mid-week (~16 min on Wednesday)
  - Members have consistent short rides (~12 min), slight increase toward weekend (~14 min)
  - Ride volume: members significantly higher on weekdays; casual riders close the gap or surpass on weekends
- **Patterns by hour of day**:
  - Members exhibit clear commuting peaks (morning 7–9 AM, evening 5–7 PM)
  - Casual rides are more spread out, with a milder evening peak

## Visualizations

![Number of Rides by Day of Week](Visuals/rides_by_day_of_week.png)  
![Average Ride Duration by Day of Week](Visuals/avg_duration_by_day_of_week.png)  
![Number of Rides by Hour of Day](Visuals/rides_by_hour_of_day.png)

## Top 3 Recommendations

1. **Target weekend promotions for casual riders**  
   Offer discounted or trial annual memberships on Fridays–Sundays when casual usage peaks and ride durations are longest. Highlight leisure benefits and convenience for weekend activities.

2. **Create targeted digital campaigns around commute patterns**  
   Use social media and email ads during peak member hours (7–9 AM and 5–7 PM) to show casual riders how an annual membership saves money and time compared to single-ride passes for frequent short trips.

3. **Leverage station-based and seasonal messaging**  
   Identify popular casual start stations (especially near tourist areas or parks) and run location-specific ads. Emphasize flexibility of membership for both commuting and leisure — convert casual users who already ride frequently but pay per ride.

## Next Steps & Limitations
- Re-run analysis on full dataset without sampling  
- Incorporate external data (weather, events, station attributes)  
- Conduct A/B testing of proposed marketing tactics  
- Limitation: analysis based on sample; outliers and seasonal effects may vary in full data


Thank you for reviewing!
