-- ============================================================
-- Bangalore Restaurant Market Analysis
-- Phase 2: Data Import
-- ============================================================

USE bangalore_restaurant_analysis;

-- Data imported from:
-- processed_data/zomato_mysql.csv

-- Import Method:
-- Python (Pandas + SQLAlchemy)

-- Table Name:
-- zomato

-- Verify successful import

SELECT COUNT(*) AS total_restaurants
FROM zomato;
