# 05_Q1_Restaurant_Popularity.sql

```sql
-- =====================================================
-- Project: Bangalore Restaurant Market Analysis
-- File: 05_Q1_Restaurant_Popularity.sql
-- =====================================================

USE bangalore_restaurant_analysis;

-- =====================================================
-- Task 1: Top 10 Highest Rated Restaurants
-- Business Question:
-- Which restaurants have the highest customer ratings?
--
-- Purpose:
-- Identify restaurants with excellent customer satisfaction.
-- =====================================================

SELECT
    name,
    rating,
    votes
FROM zomato_cleaned
WHERE rating IS NOT NULL
ORDER BY rating DESC, votes DESC
LIMIT 10;


-- =====================================================
-- Task 2: Top 10 Most Popular Restaurants
-- Business Question:
-- Which restaurants have received the highest customer engagement?
--
-- Purpose:
-- Customer votes indicate popularity and customer interaction.
-- Restaurants with more votes generally have a stronger market presence.
-- =====================================================

SELECT
    name,
    rating,
    votes
FROM zomato_cleaned
WHERE votes > 0
ORDER BY votes DESC
LIMIT 10;


-- =====================================================
-- Task 3: Restaurant Chains with Multiple Branches
-- Business Question:
-- Which restaurant brands have multiple branches in Bangalore?
--
-- Purpose:
-- Identify restaurant chains with a larger market presence.
-- =====================================================

SELECT
    name,
    COUNT(*) AS branch_count
FROM zomato_cleaned
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY branch_count DESC;


-- =====================================================
-- Task 4: Restaurant Chains with Highest Average Rating
-- Business Question:
-- Which restaurant chains maintain the highest average ratings?
--
-- Purpose:
-- Evaluate consistency in customer satisfaction across
-- restaurants having multiple branches.
-- =====================================================

SELECT
    name,
    COUNT(*) AS branch_count,
    AVG(rating) AS average_rating
FROM zomato_cleaned
WHERE rating IS NOT NULL
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY average_rating DESC
LIMIT 10;


-- =====================================================
-- Task 5: Rank Restaurant Chains by Average Rating
-- Business Question:
-- Rank restaurant chains based on their average ratings.
--
-- Purpose:
-- Window functions provide an ordered ranking while
-- preserving all qualifying rows.
-- =====================================================

WITH restaurant_rating AS
(
    SELECT
        name,
        COUNT(*) AS branch_count,
        AVG(rating) AS average_rating
    FROM zomato_cleaned
    WHERE rating IS NOT NULL
    GROUP BY name
    HAVING COUNT(*) > 1
)

SELECT
    name,
    branch_count,
    average_rating,
    RANK() OVER (ORDER BY average_rating DESC) AS restaurant_rank
FROM restaurant_rating
ORDER BY restaurant_rank
LIMIT 10;


-- =====================================================
-- Task 6: Restaurants Rated Above the Overall Average
-- Business Question:
-- Which restaurants perform better than the overall average rating?
--
-- Purpose:
-- Compare each restaurant against the overall market benchmark
-- using a scalar subquery.
-- =====================================================

SELECT
    name,
    location,
    rating,
    votes
FROM zomato_cleaned
WHERE rating >
(
    SELECT AVG(rating)
    FROM zomato_cleaned
    WHERE rating IS NOT NULL
)
ORDER BY rating DESC, votes DESC;
```

