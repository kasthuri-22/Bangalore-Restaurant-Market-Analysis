-- =====================================================
-- Project: Bangalore Restaurant Market Analysis
-- File: 04_Data_Cleaning.sql
-- Database: bangalore_restaurant_analysis
--
-- Description:
-- This script performs data cleaning by creating a
-- working copy of the raw dataset, cleaning ratings,
-- cleaning restaurant costs, and validating data quality.
-- =====================================================

USE bangalore_restaurant_analysis;

-- =====================================================
-- Task 1: Create a working copy of the raw dataset
-- =====================================================

CREATE TABLE zomato_cleaned AS
SELECT *
FROM zomato;

-- =====================================================
-- Task 2: Inspect distinct values in the rate column
-- =====================================================

SELECT DISTINCT rate
FROM zomato_cleaned;

-- =====================================================
-- Task 3: Add cleaned rating column
-- =====================================================

ALTER TABLE zomato_cleaned
ADD rating DECIMAL(2,1);

-- =====================================================
-- Task 4: Populate cleaned rating column
-- =====================================================

SET SQL_SAFE_UPDATES = 0;

UPDATE zomato_cleaned
SET rating =
    CASE
        WHEN rate IS NULL
             OR rate = 'NEW'
             OR rate = '-'
        THEN NULL
        ELSE SUBSTRING_INDEX(rate, '/', 1)
    END;

SET SQL_SAFE_UPDATES = 1;

-- =====================================================
-- Task 5: Validate cleaned ratings
-- =====================================================

SELECT
    rate,
    rating
FROM zomato_cleaned
LIMIT 20;

-- =====================================================
-- Task 6: Inspect restaurant cost values
-- =====================================================

SELECT DISTINCT `approx_cost(for two people)`
FROM zomato_cleaned;

-- =====================================================
-- Task 7: Add cleaned cost column
-- =====================================================

ALTER TABLE zomato_cleaned
ADD approx_cost_for_two_cleaned INT;

-- =====================================================
-- Task 8: Populate cleaned cost column
-- =====================================================

SET SQL_SAFE_UPDATES = 0;

UPDATE zomato_cleaned
SET approx_cost_for_two_cleaned =
    CASE
        WHEN `approx_cost(for two people)` IS NULL
        THEN NULL
        ELSE CAST(
                 REPLACE(`approx_cost(for two people)`, ',', '')
                 AS UNSIGNED
             )
    END;

SET SQL_SAFE_UPDATES = 1;

-- =====================================================
-- Task 9: Validate cleaned costs
-- =====================================================

SELECT
    `approx_cost(for two people)`,
    approx_cost_for_two_cleaned
FROM zomato_cleaned
LIMIT 20;

-- =====================================================
-- Task 10: Inspect categorical values
-- =====================================================

SELECT DISTINCT online_order
FROM zomato_cleaned;

SELECT DISTINCT book_table
FROM zomato_cleaned;

-- =====================================================
-- Task 11: Assess missing values
-- =====================================================

SELECT
    SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS location_null,
    SUM(CASE WHEN cuisines IS NULL THEN 1 ELSE 0 END) AS cuisines_null,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS rating_null,
    SUM(CASE WHEN approx_cost_for_two_cleaned IS NULL THEN 1 ELSE 0 END) AS cost_null
FROM zomato_cleaned;

-- =====================================================
-- End of Data Cleaning
-- =====================================================
