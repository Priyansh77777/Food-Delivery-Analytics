# Food Delivery Data Profiling & Analysis Plan

## 1. Dataset Summary
- **Total Records:** 1000
- **Total Features:** 8
(Order_ID is an identifier, not a feature used for analysis/modeling)

## 2. Missing Values Assessment
| Column                 | Missing Values |
| :---                   | :---           |
| Order_ID               | 0              |
| Distance_km            | 0              |      
| Weather                | 30             |
| Traffic_Level          | 30             |
| Time_of_Day            | 30             |
| Vehicle_Type           | 0              |
| Preparation_Time_min   | 0              |
| Courier_Experience_yrs | 30             |
| Delivery_Time_min      | 0              |

## 3. Unique Categories
- **Weather:** `Clear`, `Rainy`, `Foggy`, `Windy`, `Snowy`
- **Traffic_Level:** `Low`, `Medium`, `High`
- **Time_of_Day:** `Morning`, `Afternoon`, `Evening`, `Night`
- **Vehicle_Type:** `Bike`, `Scooter`, `Car`

## 4. Analysis Plan Questions
**Q1.** What is the average delivery time?
**Q2.** Which traffic level causes maximum delay?
**Q3.** Which weather condition causes maximum delay?
**Q4.** Does preparation time increase delivery time?
**Q5.** Does courier experience reduce delivery time?
**Q6.** Which vehicle performs best?
**Q7.** Which time of day experiences maximum delays?
**Q8.** Which factor contributes most to delivery delays?