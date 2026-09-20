# Food Delivery Operations Intelligence

## Business Problem

Food delivery companies frequently experience delays due to multiple operational factors such as traffic, weather conditions, restaurant preparation time, delivery distance, and courier availability. The objective of this project is to identify the major drivers of delivery delays and recommend operational improvements that can help reduce delivery time and improve customer experience.

Because the underlying SQL scripts and dashboard files are kept offline, this README serves as the complete executive summary of the data, methodology, and strategic findings.

## Project Goals

* Identify the key factors affecting delivery time.
* Measure the impact of operational variables on delivery performance.
* Identify characteristics of delayed orders.
* Recommend actionable steps to reduce delivery delays.

## Dataset Overview

The analysis was conducted on a dataset of 1,000 food delivery records, capturing 8 core operational features per order.

* **Key Features:** Delivery distance (km), traffic conditions (Low, Medium, High), weather conditions (Clear, Rainy, Foggy, Windy, Snowy), time of day (Morning, Afternoon, Evening, Night), vehicle type (Bike, Scooter, Car), preparation time (min), courier experience (yrs), and final delivery time (min).
* **Data Quality:** 30 records contained missing values across the Weather, Traffic_Level, Time_of_Day, and Courier_Experience_yrs columns. To ensure analytical integrity, these records were filtered out into a clean view for accurate average and correlation calculations.

## Hypotheses Tested

The analytical workflow was structured to test six primary operational hypotheses:

1. Higher traffic levels increase delivery time.
2. Longer delivery distances increase delivery time.
3. Higher preparation times increase total delivery time.
4. Adverse weather conditions increase delivery time.
5. More experienced couriers complete deliveries faster.
6. Specific operational factors contribute more heavily to delays than others.

## Analytical Methodology

The data was processed and evaluated using a structured SQL-driven approach, mapping directly to an executive dashboard framework:

* **Data Segmentation:** Operational variables were categorized to surface patterns. Preparation times were bucketed into Fast (<=10 min), Medium (11-20 min), and Slow (>20 min). Courier experience was grouped into 0-2 Years, 3-5 Years, and 6+ Years. Distances were grouped into Short (<=5km), Medium (<=15km), and Long (>15km) ranges.
* **Statistical Validation:** SQL standard deviation and variance functions were utilized to calculate the mathematical correlation between preparation time and final delivery time.
* **Executive Dashboarding Logic:** The analysis output was mapped to a three-page dashboard structure: Page 1 for high-level KPIs (Total Orders, Average Delivery Time, Distance, and Prep Time), Page 2 for ranking the root delay drivers, and Page 3 for translating the findings into business recommendations.

## Strategic Recommendations

Based on the delay driver analysis, the following operational actions are recommended to optimize performance:

* **Priority 1: Reduce Delivery Distance.** Because distance is a primary driver of delays, operations should tighten delivery radiuses or route orders to closer fulfillment centers.
* **Priority 2: Reduce Preparation Time.** Engage directly with restaurant partners whose metrics consistently place them in the "Slow Prep (>20 min)" category to streamline order handoffs and avoid courier wait times.
* **Priority 3: Traffic & Weather Adaptation.** Implement dynamic dispatching and adjusted delivery time estimates to account for adverse weather conditions and heavy traffic bottlenecks.
