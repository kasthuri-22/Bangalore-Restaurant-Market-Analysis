# 06_Q2_Location_Analysis.sql

```sql
-- =====================================================
-- Project: Bangalore Restaurant Market Analysis
-- Phase 06: Location Analysis
-- =====================================================

USE bangalore_restaurant_analysis;

-- =====================================================
-- Task 1: Restaurant Density by Location
-- Business Question:
-- Which locations have the highest number of restaurants?
--
-- Purpose:
-- Identify restaurant hubs and understand market size
-- and competition across Bangalore.
-- =====================================================

SELECT
    location,
    COUNT(*) AS restaurant_count
FROM zomato_cleaned
WHERE location IS NOT NULL
GROUP BY location
ORDER BY restaurant_count DESC
LIMIT 10;


-- =====================================================
-- Task 2: Customer Engagement by Location
-- Business Question:
-- Which locations generate the highest customer engagement?
--
-- Purpose:
-- Total customer votes indicate customer activity and
-- popularity of restaurants within each location.
-- =====================================================

SELECT
    location,
    SUM(votes) AS total_votes
FROM zomato_cleaned
WHERE location IS NOT NULL
GROUP BY location
ORDER BY total_votes DESC
LIMIT 10;


-- =====================================================
-- Task 3: High-Quality Restaurant Concentration
-- Business Question:
-- Which locations have the highest number of highly rated
-- restaurants (Rating >= 4.0)?
--
-- Purpose:
-- Measure the concentration of quality restaurants in
-- each location using conditional aggregation.
-- =====================================================

SELECT
    location,
    SUM(
        CASE
            WHEN rating >= 4.0 THEN 1
            ELSE 0
        END
    ) AS highly_rated_restaurants
FROM zomato_cleaned
WHERE location IS NOT NULL
GROUP BY location
ORDER BY highly_rated_restaurants DESC
LIMIT 10;


-- =====================================================
-- Task 4: Online Ordering Adoption Rate
-- Business Question:
-- Which locations have the highest percentage of
-- restaurants offering online ordering?
--
-- Purpose:
-- Evaluate digital adoption and delivery readiness
-- across different locations.
-- =====================================================

WITH location_online_orders AS
(
    SELECT
        location,
        COUNT(*) AS total_restaurants,
        SUM(
            CASE
                WHEN online_order = 'Yes' THEN 1
                ELSE 0
            END
        ) AS online_order_restaurants
    FROM zomato_cleaned
    WHERE location IS NOT NULL
    GROUP BY location
)

SELECT
    location,
    total_restaurants,
    online_order_restaurants,
    ROUND(
        (online_order_restaurants * 100.0) / total_restaurants,
        2
    ) AS online_order_percentage
FROM location_online_orders
ORDER BY online_order_percentage DESC
LIMIT 10;


-- =====================================================
-- Task 5: Rating and Cost Comparison by Location
-- Business Question:
-- Which locations provide high customer satisfaction
-- at a reasonable average cost?
--
-- Purpose:
-- Compare locations based on average restaurant rating
-- and average cost for two people.
-- =====================================================

SELECT
    location,
    ROUND(AVG(rating), 2) AS average_rating,
    ROUND(AVG(approx_cost_for_two_cleaned), 2) AS average_cost_for_two
FROM zomato_cleaned
WHERE location IS NOT NULL
  AND rating IS NOT NULL
  AND approx_cost_for_two_cleaned IS NOT NULL
GROUP BY location
ORDER BY average_rating DESC,
         average_cost_for_two ASC
LIMIT 10;


-- =====================================================
-- Task 6: Overall Location Performance Summary
-- Business Question:
-- Which locations perform best overall based on market
-- size, customer satisfaction, engagement, digital
-- adoption, and pricing?
--
-- Purpose:
-- Build a business summary combining multiple KPIs to
-- support location comparison and expansion decisions.
-- =====================================================

WITH location_summary AS
(
    SELECT
        location,
        COUNT(*) AS restaurant_count,
        ROUND(AVG(rating), 2) AS average_rating,
        SUM(votes) AS total_votes,
        ROUND(AVG(approx_cost_for_two_cleaned), 2) AS average_cost_for_two,
        SUM(
            CASE
                WHEN online_order = 'Yes' THEN 1
                ELSE 0
            END
        ) AS online_order_restaurants
    FROM zomato_cleaned
    WHERE location IS NOT NULL
      AND rating IS NOT NULL
      AND approx_cost_for_two_cleaned IS NOT NULL
    GROUP BY location
)

SELECT
    location,
    restaurant_count,
    average_rating,
    total_votes,
    average_cost_for_two,
    ROUND(
        (online_order_restaurants * 100.0) / restaurant_count,
        2
    ) AS online_order_percentage
FROM location_summary
ORDER BY
    average_rating DESC,
    total_votes DESC,
    average_cost_for_two ASC
LIMIT 10;
```

