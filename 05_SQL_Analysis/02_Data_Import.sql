-- ==========================================================
-- Project: Bangalore Restaurant Market Analysis
-- Phase 2: Data Import
-- Author: Kasthuri
-- Database: DuckDB
-- ==========================================================

-- Purpose:
-- Import the Zomato restaurant dataset from a CSV file
-- into a table named 'zomato'.

CREATE OR REPLACE TABLE zomato AS
SELECT *
FROM read_csv_auto(
    'D:/Bangalore_Restaurant_Market_Analysis/data/zomato.csv',
    HEADER = TRUE
);

-- ==========================================================
-- Validation Query
-- Verify that all records were imported successfully.
-- ==========================================================

SELECT COUNT(*) AS total_rows
FROM zomato;
