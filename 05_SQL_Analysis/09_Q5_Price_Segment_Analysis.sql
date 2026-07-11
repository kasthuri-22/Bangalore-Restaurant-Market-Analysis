```sql
-- =====================================================
-- Project: Bangalore Restaurant Market Analysis
-- Phase 09: Pricing Analysis
-- =====================================================

USE bangalore_restaurant_analysis;


-- =====================================================
-- Task 1: Restaurant Price Distribution
-- Business Question:
-- How are restaurants distributed across price segments?
--
-- Purpose:
-- Classify restaurants into price categories and measure
-- the market share of each pricing segment.
-- =====================================================

SELECT
    CASE
        WHEN approx_cost_for_two_cleaned <= 500 THEN 'Budget'
        WHEN approx_cost_for_two_cleaned <= 1000 THEN 'Mid-range'
        WHEN approx_cost_for_two_cleaned <= 2000 THEN 'Premium'
        ELSE 'Luxury'
    END AS price_category,
    COUNT(*) AS restaurant_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
        2
    ) AS restaurant_percentage
FROM zomato_cleaned
WHERE approx_cost_for_two_cleaned IS NOT NULL
GROUP BY price_category
ORDER BY restaurant_percentage DESC;


-- =====================================================
-- Task 2: Price Segment vs Customer Rating
-- Business Question:
-- Do higher-priced restaurant segments receive higher
-- average customer ratings?
--
-- Purpose:
-- Compare customer satisfaction across price segments.
-- =====================================================

SELECT
    CASE
        WHEN approx_cost_for_two_cleaned <= 500 THEN 'Budget'
        WHEN approx_cost_for_two_cleaned <= 1000 THEN 'Mid-range'
        WHEN approx_cost_for_two_cleaned <= 2000 THEN 'Premium'
        ELSE 'Luxury'
    END AS price_category,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(rating), 2) AS average_rating
FROM zomato_cleaned
WHERE approx_cost_for_two_cleaned IS NOT NULL
  AND rating IS NOT NULL
GROUP BY price_category
ORDER BY average_rating DESC;


-- =====================================================
-- Task 3: Price Segment vs Customer Engagement
-- Business Question:
-- Which price segment receives the highest customer
-- engagement?
--
-- Purpose:
-- Compare total and average customer votes across
-- restaurant price segments.
-- =====================================================

SELECT
    CASE
        WHEN approx_cost_for_two_cleaned <= 500 THEN 'Budget'
        WHEN approx_cost_for_two_cleaned <= 1000 THEN 'Mid-range'
        WHEN approx_cost_for_two_cleaned <= 2000 THEN 'Premium'
        ELSE 'Luxury'
    END AS price_category,
    SUM(votes) AS total_votes,
    ROUND(AVG(votes), 2) AS average_votes
FROM zomato_cleaned
WHERE approx_cost_for_two_cleaned IS NOT NULL
  AND votes IS NOT NULL
GROUP BY price_category
ORDER BY average_votes DESC;


-- =====================================================
-- Task 4: Pricing and Customer Service Adoption
-- Business Question:
-- How does online ordering and table booking adoption
-- vary across restaurant price segments?
--
-- Purpose:
-- Measure customer service adoption across different
-- restaurant pricing categories.
-- =====================================================

WITH price_service_summary AS
(
    SELECT
        CASE
            WHEN approx_cost_for_two_cleaned <= 500 THEN 'Budget'
            WHEN approx_cost_for_two_cleaned <= 1000 THEN 'Mid-range'
            WHEN approx_cost_for_two_cleaned <= 2000 THEN 'Premium'
            ELSE 'Luxury'
        END AS price_category,
        COUNT(*) AS restaurant_count,

        SUM(
            CASE
                WHEN online_order = 'Yes' THEN 1
                ELSE 0
            END
        ) AS online_order_restaurants,

        SUM(
            CASE
                WHEN book_table = 'Yes' THEN 1
                ELSE 0
            END
        ) AS table_booking_restaurants

    FROM zomato_cleaned
    WHERE approx_cost_for_two_cleaned IS NOT NULL
    GROUP BY price_category
)

SELECT
    price_category,
    restaurant_count,
    ROUND(
        online_order_restaurants * 100.0 / restaurant_count,
        2
    ) AS online_order_percentage,
    ROUND(
        table_booking_restaurants * 100.0 / restaurant_count,
        2
    ) AS table_booking_percentage
FROM price_service_summary
ORDER BY table_booking_percentage DESC;


-- =====================================================
-- Task 5: Overall Price Performance Summary
-- Business Question:
-- Which restaurant price segment demonstrates the
-- strongest overall performance and service positioning?
--
-- Purpose:
-- Combine customer satisfaction, engagement, and service
-- adoption metrics for an overall price segment analysis.
-- =====================================================

WITH price_performance_summary AS
(
    SELECT
        CASE
            WHEN approx_cost_for_two_cleaned <= 500 THEN 'Budget'
            WHEN approx_cost_for_two_cleaned <= 1000 THEN 'Mid-range'
            WHEN approx_cost_for_two_cleaned <= 2000 THEN 'Premium'
            ELSE 'Luxury'
        END AS price_category,

        COUNT(*) AS restaurant_count,
        ROUND(AVG(rating), 2) AS average_rating,
        ROUND(AVG(votes), 2) AS average_votes,

        SUM(
            CASE
                WHEN online_order = 'Yes' THEN 1
                ELSE 0
            END
        ) AS online_order_restaurants,

        SUM(
            CASE
                WHEN book_table = 'Yes' THEN 1
                ELSE 0
            END
        ) AS table_booking_restaurants

    FROM zomato_cleaned
    WHERE approx_cost_for_two_cleaned IS NOT NULL
    GROUP BY price_category
)

SELECT
    price_category,
    restaurant_count,
    average_rating,
    average_votes,
    ROUND(
        online_order_restaurants * 100.0 / restaurant_count,
        2
    ) AS online_order_percentage,
    ROUND(
        table_booking_restaurants * 100.0 / restaurant_count,
        2
    ) AS table_booking_percentage
FROM price_performance_summary
ORDER BY
    average_rating DESC,
    average_votes DESC;
```

