```sql
-- =====================================================
-- Project: Bangalore Restaurant Market Analysis
-- Phase 08: Customer Behavior Analysis
-- =====================================================

USE bangalore_restaurant_analysis;


-- =====================================================
-- Task 1: Online Ordering vs Customer Ratings
-- Business Question:
-- Do restaurants offering online ordering have higher
-- average customer ratings?
--
-- Purpose:
-- Compare customer satisfaction between restaurants
-- offering and not offering online ordering.
-- =====================================================

SELECT
    online_order,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(rating), 2) AS average_rating
FROM zomato_cleaned
WHERE online_order IS NOT NULL
  AND rating IS NOT NULL
GROUP BY online_order
ORDER BY average_rating DESC;


-- =====================================================
-- Task 2: Online Ordering vs Customer Engagement
-- Business Question:
-- Do restaurants offering online ordering receive
-- greater customer engagement?
--
-- Purpose:
-- Compare total and average customer votes across
-- online ordering categories.
-- =====================================================

SELECT
    online_order,
    COUNT(*) AS restaurant_count,
    SUM(votes) AS total_votes,
    ROUND(AVG(votes), 2) AS average_votes
FROM zomato_cleaned
WHERE online_order IS NOT NULL
  AND votes IS NOT NULL
GROUP BY online_order
ORDER BY average_votes DESC;


-- =====================================================
-- Task 3: Table Booking vs Restaurant Performance
-- Business Question:
-- Do restaurants offering table booking achieve higher
-- ratings and customer engagement?
--
-- Purpose:
-- Evaluate the relationship between table booking
-- availability and restaurant performance.
-- =====================================================

SELECT
    book_table,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(rating), 2) AS average_rating,
    SUM(votes) AS total_votes,
    ROUND(AVG(votes), 2) AS average_votes
FROM zomato_cleaned
WHERE book_table IS NOT NULL
  AND rating IS NOT NULL
  AND votes IS NOT NULL
GROUP BY book_table
ORDER BY average_rating DESC;


-- =====================================================
-- Task 4: Customer Service Combination Analysis
-- Business Question:
-- Which combination of online ordering and table booking
-- is associated with stronger restaurant performance?
--
-- Purpose:
-- Compare customer satisfaction, engagement, and pricing
-- across different service combinations.
-- =====================================================

SELECT
    online_order,
    book_table,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(rating), 2) AS average_rating,
    SUM(votes) AS total_votes,
    ROUND(AVG(votes), 2) AS average_votes,
    ROUND(
        AVG(approx_cost_for_two_cleaned),
        2
    ) AS average_cost_for_two
FROM zomato_cleaned
WHERE online_order IS NOT NULL
  AND book_table IS NOT NULL
  AND rating IS NOT NULL
  AND votes IS NOT NULL
  AND approx_cost_for_two_cleaned IS NOT NULL
GROUP BY
    online_order,
    book_table
ORDER BY
    average_rating DESC,
    average_votes DESC;


-- =====================================================
-- Task 5: Customer Service Adoption Distribution
-- Business Question:
-- What percentage of restaurants fall into each online
-- ordering and table booking service combination?
--
-- Purpose:
-- Measure service adoption patterns across restaurants.
-- A window function is used to calculate each group's
-- percentage of the overall restaurant population.
-- =====================================================

SELECT
    online_order,
    book_table,
    COUNT(*) AS restaurant_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
        2
    ) AS restaurant_percentage
FROM zomato_cleaned
WHERE online_order IS NOT NULL
  AND book_table IS NOT NULL
GROUP BY
    online_order,
    book_table
ORDER BY restaurant_percentage DESC;
```

## Key Business Insights

* Restaurants offering table booking showed substantially higher average ratings and customer engagement than restaurants without table booking.
* Restaurants supporting both online ordering and table booking recorded the highest average votes per restaurant, indicating strong customer engagement.
* Restaurants offering table booking also had higher average pricing, suggesting that table booking is more common among premium or dine-in-focused restaurant segments.
* Online ordering was widely available among restaurants, particularly in restaurants without table booking.
* The relationship between customer services and restaurant performance should be interpreted as an association rather than causation. Restaurant type, pricing, and market positioning may also influence ratings and customer engagement.

## Business Interpretation

The analysis suggests that table booking availability is strongly associated with higher customer satisfaction and engagement. Restaurants offering both digital ordering and table reservation services demonstrate particularly strong customer interaction.

However, table-booking restaurants also operate at higher average price points. Therefore, restaurant segment and premium positioning may partially explain their stronger performance.

For restaurant businesses, customer-facing services should be selected based on restaurant positioning. Online ordering may be particularly important for affordable and delivery-focused restaurants, while table booking appears more relevant for premium and dine-in-oriented restaurants.

```
```

