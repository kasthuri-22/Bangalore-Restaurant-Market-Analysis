-- =====================================================
-- 03_Data_Inspection.sql
-- Project: Bangalore Restaurant Market Analysis
-- Description: Initial inspection of the dataset before cleaning
-- =====================================================

USE bangalore_restaurant_analysis;

-- 1. Inspect table structure
DESCRIBE zomato;

-- 2. Preview sample records
SELECT *
FROM zomato
LIMIT 50;

-- 3. Verify total row count
SELECT COUNT(*)
FROM zomato;

-- 4. Check NULL values in rate
SELECT COUNT(*)
FROM zomato
WHERE rate IS NULL;

-- 5. Check NULL values in important columns
SELECT
    SUM(CASE WHEN rate IS NULL THEN 1 ELSE 0 END) AS rate_null,
    SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS location_null,
    SUM(CASE WHEN cuisines IS NULL THEN 1 ELSE 0 END) AS cuisines_null
FROM zomato;

-- 6. Find duplicate restaurants
SELECT
    name,
    location,
    address,
    COUNT(*) AS duplicate_count
FROM zomato
GROUP BY
    name,
    location,
    address
HAVING COUNT(*) > 1;

-- 7. Inspect unique online_order values
SELECT DISTINCT online_order
FROM zomato
ORDER BY online_order;

-- 8. Summary statistics for votes
SELECT
    MIN(votes) AS minimum_votes,
    MAX(votes) AS maximum_votes,
    AVG(votes) AS average_votes
FROM zomato;
