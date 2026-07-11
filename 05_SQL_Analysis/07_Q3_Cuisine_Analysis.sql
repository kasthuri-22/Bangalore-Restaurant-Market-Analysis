```sql
-- =====================================================
-- Project: Bangalore Restaurant Market Analysis
-- Phase 07: Cuisine Analysis
-- =====================================================

USE bangalore_restaurant_analysis;


-- =====================================================
-- Task 1: Most Popular Cuisine Combinations
-- Business Question:
-- Which cuisine combinations are offered by the largest
-- number of restaurants?
--
-- Purpose:
-- Identify the cuisine combinations with the strongest
-- market presence in Bangalore.
-- =====================================================

SELECT
    cuisines,
    COUNT(*) AS restaurant_count
FROM zomato_cleaned
WHERE cuisines IS NOT NULL
GROUP BY cuisines
ORDER BY restaurant_count DESC
LIMIT 10;


-- =====================================================
-- Task 2: Highest Rated Cuisine Combinations
-- Business Question:
-- Which cuisine combinations receive the highest
-- average customer ratings?
--
-- Purpose:
-- Measure customer satisfaction across cuisine
-- combinations.
-- =====================================================

SELECT
    cuisines,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(rating), 2) AS average_rating
FROM zomato_cleaned
WHERE cuisines IS NOT NULL
  AND rating IS NOT NULL
GROUP BY cuisines
ORDER BY average_rating DESC,
         restaurant_count DESC
LIMIT 10;


-- =====================================================
-- Task 3: Customer Engagement by Cuisine
-- Business Question:
-- Which cuisine combinations receive the highest
-- customer engagement?
--
-- Purpose:
-- Total votes are used as an indicator of customer
-- interaction and restaurant popularity.
-- =====================================================

SELECT
    cuisines,
    COUNT(*) AS restaurant_count,
    SUM(votes) AS total_votes
FROM zomato_cleaned
WHERE cuisines IS NOT NULL
  AND votes IS NOT NULL
GROUP BY cuisines
ORDER BY total_votes DESC,
         restaurant_count DESC
LIMIT 10;


-- =====================================================
-- Task 4: Pricing by Cuisine Combination
-- Business Question:
-- Which cuisine combinations have the highest average
-- cost for two?
--
-- Purpose:
-- Understand pricing differences and identify premium
-- cuisine segments in the Bangalore restaurant market.
-- =====================================================

SELECT
    cuisines,
    COUNT(*) AS restaurant_count,
    ROUND(
        AVG(approx_cost_for_two_cleaned),
        2
    ) AS average_cost_for_two
FROM zomato_cleaned
WHERE cuisines IS NOT NULL
  AND approx_cost_for_two_cleaned IS NOT NULL
GROUP BY cuisines
ORDER BY average_cost_for_two DESC,
         restaurant_count DESC
LIMIT 10;


-- =====================================================
-- Task 5: Cuisine Performance Summary
-- Business Question:
-- Which cuisine combinations perform best overall based
-- on market presence, ratings, customer engagement,
-- pricing, and online ordering adoption?
--
-- Purpose:
-- Combine multiple business KPIs to understand the
-- overall performance of cuisine combinations.
-- =====================================================

WITH cuisine_summary AS
(
    SELECT
        cuisines,
        COUNT(*) AS restaurant_count,
        ROUND(AVG(rating), 2) AS average_rating,
        SUM(votes) AS total_votes,
        ROUND(
            AVG(approx_cost_for_two_cleaned),
            2
        ) AS average_cost_for_two,

        SUM(
            CASE
                WHEN online_order = 'Yes' THEN 1
                ELSE 0
            END
        ) AS online_order_restaurants

    FROM zomato_cleaned

    WHERE cuisines IS NOT NULL
      AND rating IS NOT NULL
      AND approx_cost_for_two_cleaned IS NOT NULL

    GROUP BY cuisines
)

SELECT
    cuisines,
    restaurant_count,
    average_rating,
    total_votes,
    average_cost_for_two,

    ROUND(
        (online_order_restaurants * 100.0)
        / restaurant_count,
        2
    ) AS online_order_percentage

FROM cuisine_summary

ORDER BY
    average_rating DESC,
    total_votes DESC,
    average_cost_for_two ASC

LIMIT 10;


-- =====================================================
-- KEY BUSINESS QUESTION:
-- Why do certain cuisine combinations dominate the
-- Bangalore restaurant market?
--
-- Analytical Approach:
-- Market dominance should not be explained using
-- restaurant count alone. Dominant cuisine combinations
-- are evaluated using:
--
-- 1. Restaurant availability / market presence
-- 2. Customer ratings
-- 3. Customer engagement through votes
-- 4. Online ordering adoption
-- 5. Average pricing
--
-- Cuisine combinations with a large restaurant presence
-- and strong customer engagement indicate sustained
-- customer demand. Strong ratings may further suggest
-- customer satisfaction, while high online-order adoption
-- indicates accessibility and delivery readiness.
--
-- Therefore, the SQL analysis suggests that cuisine
-- combinations may dominate the Bangalore restaurant
-- market when broad availability is supported by strong
-- customer engagement and convenient service options.
--
-- Important Limitation:
-- The cuisines column contains multiple cuisines in a
-- single field. Therefore, this SQL phase analyzes cuisine
-- combinations rather than individual cuisines.
--
-- Individual cuisines will be split and analyzed in the
-- Python EDA phase for more accurate cuisine-level
-- insights.
-- =====================================================
```

