CREATE DATABASE IF NOT EXISTS food_delivery;
USE food_delivery;

## Initial Dataset Statistics
SELECT COUNT(*) AS total_orders
FROM orders;

SELECT ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM orders;

SELECT
MIN(Delivery_Time_min) AS min_delivery_time,
MAX(Delivery_Time_min) AS max_delivery_time
FROM orders;

SELECT ROUND(AVG(Preparation_Time_min),2) AS avg_prep_time
FROM orders;

SELECT ROUND(AVG(Distance_km),2) AS avg_distance
FROM orders;

-- Delay Driver Analysis

SELECT
    Traffic_Level,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM orders
GROUP BY Traffic_Level
ORDER BY avg_delivery_time DESC;

SELECT
    Weather,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM orders
WHERE Weather <> ''
GROUP BY Weather
ORDER BY avg_delivery_time DESC;

SELECT
    Vehicle_Type,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM orders
GROUP BY Vehicle_Type
ORDER BY avg_delivery_time;

SELECT
    Time_of_Day,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM orders
GROUP BY Time_of_Day
ORDER BY avg_delivery_time DESC;

SELECT
    ROUND(AVG(Courier_Experience_yrs),2) AS avg_experience,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM orders;

CREATE VIEW clean_orders AS
SELECT *
FROM orders
WHERE Weather <> ''
  AND Traffic_Level <> ''
  AND Time_of_Day <> '';
  
  SELECT
    CASE
        WHEN Preparation_Time_min <= 10 THEN 'Fast Prep (<=10 min)'
        WHEN Preparation_Time_min <= 20 THEN 'Medium Prep (11-20 min)'
        ELSE 'Slow Prep (>20 min)'
    END AS prep_category,
    
    COUNT(*) AS total_orders,
    ROUND(AVG(Preparation_Time_min),2) AS avg_prep_time,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time

FROM clean_orders
GROUP BY prep_category
ORDER BY avg_delivery_time;

SELECT
    CASE
        WHEN Courier_Experience_yrs <= 2 THEN '0-2 Years'
        WHEN Courier_Experience_yrs <= 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END AS experience_group,
    
    COUNT(*) AS total_orders,
    ROUND(AVG(Courier_Experience_yrs),2) AS avg_experience,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM clean_orders
GROUP BY experience_group
ORDER BY avg_delivery_time DESC;

# Advanced Analysis
## Corelation check
SELECT
    ROUND(
        (
            AVG(Preparation_Time_min * Delivery_Time_min)
            - AVG(Preparation_Time_min) * AVG(Delivery_Time_min)
        ) /
        (
            STDDEV(Preparation_Time_min)
            * STDDEV(Delivery_Time_min)
        )
    ,3) AS correlation
FROM clean_orders;

## Distance Impact
SELECT
    CASE
        WHEN Distance_km <= 5 THEN 'Short'
        WHEN Distance_km <= 15 THEN 'Medium'
        ELSE 'Long'
    END AS distance_group,
    COUNT(*) AS orders,
    ROUND(AVG(Distance_km),2) AS avg_distance,
    ROUND(AVG(Delivery_Time_min),2) AS avg_delivery_time
FROM clean_orders
GROUP BY distance_group
ORDER BY avg_delivery_time;

