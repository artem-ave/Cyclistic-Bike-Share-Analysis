# Cyclistic Bike-Share Case Study – Google Data Analytics Capstone

## Overview
This project is my capstone for the Google Data Analytics Professional Certificate.  
I analyzed the **most recent 12 months** of Divvy (Cyclistic) bike-share trip data (February 2025 – January 2026) to understand differences in usage patterns between **annual members** and **casual riders**.  

The goal: Provide data-driven insights to help convert casual riders into annual members.

## Business Task
How do annual members and casual riders use Cyclistic bikes differently?  
Insights will support marketing strategies focused on conversion.

## Data Source
- **Source**: Public Divvy trip data (Lyft Bikes and Scooters, LLC) – [https://divvy-tripdata.s3.amazonaws.com/index.html](https://divvy-tripdata.s3.amazonaws.com/index.html)  
- **License**: Open for analysis (non-commercial use)  
- **Period**: February 2025 – January 2026 (12 full months, latest available as of Feb 2026)  
- **Format**: 12 monthly CSV files (~5–30 MB each)  
- **Key columns**: ride_id, rideable_type, started_at, ended_at, member_casual, start_lat/lng, end_lat/lng  
- **Privacy**: No personally identifiable information (PII) – GDPR compliant approach

## Tools Used
- **R** (dplyr, lubridate, ggplot2, readr) for data cleaning, analysis and visualization  
- **Alternative**: Tableau Public for interactive dashboards (optional)  
- **Environment**: RStudio

## Key Findings (to be updated after analysis)
- Casual riders: longer average ride duration, peak usage on weekends (leisure/tourism).  
- Annual members: shorter rides, higher frequency on weekdays (commuting).  
- Opportunity: Target casual riders with membership promotions during high-leisure periods.

## Repository Structure
- `/Scripts/cyclistic_analysis.R` – full R code for processing, cleaning and viz  
- `/Visuals/` – generated charts (PNG)  
- `/Cyclistic_Report.md` – detailed report with findings and recommendations

## Top 3 Recommendations
1. Offer weekend trial memberships or discounts to casual riders.  
2. Run targeted digital campaigns at popular casual start stations.  
3. Highlight annual membership savings for frequent weekday users.


Feel free to explore the code and visuals!
